cask "whatcable" do
  version "0.5.11"
  sha256 "c3e98ee42b32677e6283b47e1be5af4064ee7dfaa2b670a16794af8908169595"

  url "https://github.com/darrylmorley/whatcable/releases/download/v#{version}/WhatCable.zip",
      verified: "github.com/darrylmorley/whatcable/"
  name "WhatCable"
  desc "Menu bar app for USB-C cable diagnostics"
  homepage "https://github.com/darrylmorley/whatcable"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :sonoma"

  app "WhatCable.app"
  binary "#{appdir}/WhatCable.app/Contents/Helpers/whatcable"

  zap trash: [
    "~/Library/Preferences/com.bitmoor.whatcable.plist",
    "~/Library/Application Support/WhatCable",
    "~/Library/Caches/com.bitmoor.whatcable",
    "~/Library/HTTPStorages/com.bitmoor.whatcable",
  ]
end
