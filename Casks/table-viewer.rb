# Homebrew cask for the standalone Table Viewer macOS app. The release workflow
# in jbearak/table-viewer owns version and sha256 updates.
cask "table-viewer" do
  version "0.17.0"
  sha256 "ba56b95ee5703de9d9035d429742c6f2cebf0c4e06bfd3388b95ce2ba332e87e"

  url "https://github.com/jbearak/table-viewer/releases/download/v#{version}/table-viewer-#{version}-arm64.dmg",
      verified: "github.com/jbearak/table-viewer/"
  name "Table Viewer"
  desc "Fast viewer for Excel, CSV and TSV files"
  homepage "https://github.com/jbearak/table-viewer"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :monterey

  app "Table Viewer.app"

  zap trash: [
    "~/Library/Application Support/table-viewer",
    "~/Library/Preferences/com.jbearak.table-viewer.plist",
    "~/Library/Saved Application State/com.jbearak.table-viewer.savedState",
  ]

  caveats <<~EOS
    If macOS blocks the first launch, right-click Table Viewer in Finder and
    choose Open, or remove its quarantine attribute with:

      xattr -dr com.apple.quarantine "/Applications/Table Viewer.app"
  EOS
end
