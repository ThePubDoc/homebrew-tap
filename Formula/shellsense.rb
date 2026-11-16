class Shellsense < Formula
  desc "IDE-style autocomplete popup for the terminal"
  homepage "https://github.com/ThePubDoc/shellsense"
  url "https://registry.npmjs.org/shellsense/-/shellsense-0.2.1.tgz"
  sha256 "9be3963eb7ba666327d7e931e434607bbc6c06b93dea529ae8213e14cff7684c"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args

    # `shellsense setup` writes the location of the shell script into ~/.zshrc. Running the
    # command through the opt path, which stays the same across upgrades, keeps that line valid
    # when a new version replaces this one.
    (bin/"shellsense").write <<~SH
      #!/bin/sh
      exec "#{formula_opt_bin("node")}/node" --preserve-symlinks-main "#{opt_libexec}/lib/node_modules/shellsense/dist/cli.js" "$@"
    SH
    chmod 0755, bin/"shellsense"
  end

  def caveats
    <<~EOS
      To turn the popup on, run:
        shellsense setup
      and open a new terminal.

      After an upgrade, run `shellsense stop` once so shells pick up the new engine.
    EOS
  end

  test do
    assert_match "checkout", shell_output("#{bin}/shellsense suggest 'git ch' 2>&1")
  end
end
