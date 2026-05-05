cask "whatcable" do
  version "0.5.12"
  sha256 "5bce28f854fde2959453bdcae4c906a35210f47f4755d61e70b5e20c392a03f9"

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
