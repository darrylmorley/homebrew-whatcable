cask "whatcable" do
  version "0.5.5"
  sha256 "6a8a9e11c110a623be91fd0b93e5a7066bb97e5ce343dd7cc2808c3f50f7654f"

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
