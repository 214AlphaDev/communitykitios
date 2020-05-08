platform :ios, '11.0'

target 'CommunityKit' do
  use_frameworks!
  pod 'Apollo', '0.10.0'
  pod 'Sodium', '0.8.0'
  pod 'KeychainAccess', '3.1.2'
  pod 'JWTDecode', '2.2.0'
  pod 'RealmSwift', '~> 3.20.0'
  pod 'FlowKit', :git => 'git@github.com:214AlphaDev/flowkit.git', :branch => 'master'
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
