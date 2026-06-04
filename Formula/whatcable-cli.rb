class WhatcableCli < Formula
  desc "Command-line USB-C cable diagnostics"
  homepage "https://github.com/darrylmorley/whatcable"
  url "https://github.com/darrylmorley/whatcable/releases/download/v0.20.1/whatcable-cli-0.20.1.zip"
  sha256 "03d42012cc113362c3db71812ac68be44595ed5ddffa2d369d0d80d3c5d2d529"
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
    libexec.install "whatcable", "WhatCable_WhatCableCore.bundle", "Info.plist"
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
