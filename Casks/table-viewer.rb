# Homebrew cask for the standalone Table Viewer macOS app. The release workflow
# in jbearak/table-viewer owns version and sha256 updates.
cask "table-viewer" do
  version "0.14.1"
  sha256 "68de2d09029c348c687bc4a1ce18e872765ec601f4c4e613b3180a8f143f30d9"

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
