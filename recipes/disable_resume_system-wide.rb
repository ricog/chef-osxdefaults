osx-defaults_defaults "Disable resume system-wide" do
  domain 'NSGlobalDomain'
  key 'NSQuitAlwaysKeepsWindows'
  boolean false
end
