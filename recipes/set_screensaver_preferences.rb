askForPassword = (node.key?('osxdefaults') && node['osxdefaults'].key?('screensaver') && node['osxdefaults']['screensaver'].key?('askForPassword')) ? node['osxdefaults']['screensaver']['askForPassword'] : 1
askForPasswordDelay = (node.key?('osxdefaults') && node['osxdefaults'].key?('screensaver') && node['osxdefaults']['screensaver'].key?('askForPasswordDelay')) ? node['osxdefaults']['screensaver']['askForPasswordDelay'] : 60
idleTime = (node.key?('osxdefaults') && node['osxdefaults'].key?('screensaver') && node['osxdefaults']['screensaver'].key?('idleTime')) ? node['osxdefaults']['screensaver']['idleTime'] : 600

osxdefaults_defaults "ask for password when screen is locked" do
  domain 'com.apple.screensaver'
  key 'askForPassword'
  integer askForPassword
end

osxdefaults_defaults "wait #{askForPasswordDelay} seconds between screensaver & lock" do
  domain 'com.apple.screensaver'
  key 'askForPasswordDelay'
  float askForPasswordDelay
end

plist_dir = ENV['HOME'] + "/Library/Preferences/ByHost"
Dir["#{plist_dir}/com.apple.screensaver.*.plist"].each do |file|
  osxdefaults_defaults "set screensaver timeout" do
    domain "ByHost/" + File.basename(file).chomp('.plist')
    key 'idleTime'
    integer idleTime
  end
end
