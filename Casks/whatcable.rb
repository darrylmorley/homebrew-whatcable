cask "whatcable" do
  version "0.6.1"
  sha256 "b74b74e30d2e95bf1bdccd19172026250752360c89a3cd774a49fc48c75f9e1b"

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
    "~/Library/Preferences/uk.whatcable.whatcable.plist",
    "~/Library/Application Support/WhatCable",
    "~/Library/Caches/com.bitmoor.whatcable",
    "~/Library/Caches/uk.whatcable.whatcable",
    "~/Library/HTTPStorages/com.bitmoor.whatcable",
    "~/Library/HTTPStorages/uk.whatcable.whatcable",
  ]
end
