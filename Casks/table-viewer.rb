# Homebrew cask for the standalone Table Viewer macOS app. The release workflow
# in jbearak/table-viewer owns version and sha256 updates.
cask "table-viewer" do
  version "0.16.0"
  sha256 "ec8333a6ba003288f6e752f81cc5162be3c2f5199af08b651473f58f11ca84e9"

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
