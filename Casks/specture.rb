cask "specture" do
  version "0.1.0"
  sha256 "9e796d7ea5e0f34bd114a258e36ae3145b2b06bb8520c93d6664b27d61fcc0b0"

  url "https://github.com/azeveco/specture/releases/download/v#{version}/Specture_#{version}_universal.dmg"
  name "Specture"
  desc "A fast, powerful, and beautiful cross-platform screenshot tool"
  homepage "https://github.com/azeveco/specture"

  app "Specture.app"

  zap trash: [
    "~/Library/Application Support/Specture",
    "~/Library/Caches/com.azeveco.specture",
    "~/Library/Preferences/com.azeveco.specture.plist",
    "~/Library/WebKit/com.azeveco.specture"
  ]
end
