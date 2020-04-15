platform :ios, '11.0'

target 'CommunityKit' do
  use_frameworks!
  pod 'Apollo', '0.10.0'
  pod 'Sodium', '0.8.0'
  pod 'KeychainAccess', '3.1.2'
  pod 'JWTDecode', '2.2.0'
  pod 'RealmSwift', '3.16.1'
  pod 'FlowKit', :git => 'git@gitlab.com:214alpha/utilities/flowkit.git', :commit => '641d8c945c4cf209bb321bed9129bdd719d795b8'
end

target 'CommunityKitDemo' do
    use_frameworks!
    pod 'CommunityKit', :path => '.'
end

target 'CommunityKitTests' do
  use_frameworks!
  pod 'CommunityKit', :path => '.'
  pod 'Quick'
  pod 'Nimble'
end
