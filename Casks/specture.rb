cask "specture" do
  version "0.1.0"
  sha256 "64b4da8e073cde5080d999cdc6c954815dcfc02524c4ef73bd6f97a2f41932af"

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
    "~/Library/Application Support/Specture",
    "~/Library/Caches/com.azeveco.specture",
    "~/Library/Preferences/com.azeveco.specture.plist",
    "~/Library/WebKit/com.azeveco.specture"
  ]
end
