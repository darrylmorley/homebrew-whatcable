cask "whatcable" do
  version "0.7.1"
  sha256 "ffd3786affede35e9192d21cfd82141caa706584b0cb54b973efba60e314aa49"

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
