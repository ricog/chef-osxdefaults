displaySleep = (node.key?('osxdefaults') && node['osxdefaults'].key?('sleep') && node['osxdefaults']['sleep'].key?('display')) ? node['osxdefaults']['sleep']['display'] : 20
diskSleep = (node.key?('osxdefaults') && node['osxdefaults'].key?('sleep') && node['osxdefaults']['sleep'].key?('disk')) ? node['osxdefaults']['sleep']['disk'] : 15
#computerSleep = (node.key?('osxdefaults') && node['osxdefaults'].key?('sleep') && node['osxdefaults']['sleep'].key?('computer')) ? node['osxdefaults']['sleep']['computer'] : 0
computerSleep = node['osxdefaults']['sleep']['computer'].present? ? node['osxdefaults']['sleep']['computer'] : 0

execute "set display, disk and computer sleep times" do
  command "pmset -a displaysleep #{displaySleep} disksleep #{diskSleep} sleep #{computerSleep}"
end
