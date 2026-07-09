cask "specture" do
  version "0.3.0"
  sha256 "7977d9ca5103dc41561dea8c24db82864bb5b93cdc06e405d6c7e63d2d04f5e7"

  url "https://github.com/azeveco/specture/releases/download/v#{version}/Specture_#{version}_universal.dmg"
  name "Specture"
  desc "A fast, powerful, and beautiful cross-platform screenshot tool"
  homepage "https://github.com/azeveco/specture"

  app "Specture.app"

  postflight do
    system_command "xattr",
                   args: ["-cr", "#{appdir}/Specture.app"],
                   sudo: false
    system_command "codesign",
                   args: ["--force", "--deep", "-s", "-", "#{appdir}/Specture.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/com.azeveco.specture",
    "~/Library/Caches/com.azeveco.specture",
    "~/Library/Preferences/com.azeveco.specture.plist",
    "~/Library/Saved Application State/com.azeveco.specture.savedState",
    "~/Library/WebKit/com.azeveco.specture"
  ]
end
