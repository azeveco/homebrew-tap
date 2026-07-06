cask "specture" do
  version "0.2.0"
  sha256 "eae262db4ffa98db840a9a048b32ed55a7fb48c117142dfb4491f5dea29ebfce"

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
    "~/Library/WebKit/com.azeveco.specture"
  ]
end
