class WhatcableCli < Formula
  desc "Command-line USB-C cable diagnostics"
  homepage "https://github.com/darrylmorley/whatcable"
  url "https://github.com/darrylmorley/whatcable/releases/download/v1.0.1/whatcable-cli-1.0.1.zip"
  sha256 "4be98e18fd6a55283820dd45490f8830e79efebc7c837fb5fe9da4b683eef38b"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on macos: :sonoma

  def install
    # The CLI uses Swift's Bundle.module to load a bundled SQLite cable DB
    # and the USB-IF vendor list. Bundle.module's lookup is anchored at
    # Bundle.main.resourceURL, which is the directory of the running
    # binary's real path. If we symlinked bin/whatcable -> libexec/whatcable,
    # the process would launch with bin/whatcable as its path and Bundle.module
    # would look for the resource bundle in bin/ rather than libexec/. Using
    # write_exec_script makes Homebrew drop a wrapper that exec's the libexec
    # binary, so the process starts with its real path and the lookup works.
    libexec.install "whatcable", "WhatCable_WhatCableCore.bundle", "TUIkit_TUIkit.bundle", "Info.plist"
    bin.write_exec_script libexec/"whatcable"
  end

  def caveats
    <<~EOS
      Installs the `whatcable` CLI only.

      For the menu bar app, install the cask instead:
        brew install --cask whatcable

      Activate WhatCable Pro on this machine:
        whatcable --activate XXXX-XXXX-XXXX-XXXX

      Check status: `whatcable --licence`. See `whatcable --help` for more.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/whatcable --version")
    system bin/"whatcable", "--json"
  end
end
