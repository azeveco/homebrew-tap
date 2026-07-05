cask "specture" do
  version "0.1.0"
  sha256 "69375b7a4f855f403bcef9078f50a68ae36bf919d9793455f60a8a54364e1864"

  url "https://github.com/azeveco/specture/releases/download/v#{version}/Specture_#{version}_aarch64.dmg"
  name "Specture"
  desc "A fast, powerful, and beautiful cross-platform screenshot tool"
  homepage "https://github.com/azeveco/specture"

  app "Specture.app"

  # Workaounr to remove app from security lock and sign it locally after installation
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
