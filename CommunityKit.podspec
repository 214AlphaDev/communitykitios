Pod::Spec.new do |s|
  s.name          = "CommunityKit"
  s.version       = "0.0.2"
  s.summary       = "SDK that provides community related functionality to build 214 alpha applications."
  s.license       = { }
  s.homepage      = "https://github.com/214alphadev/communitykitios"
  s.author        = { "Andrii Selivanov" => "seland@214alpha.com" }
  s.platform      = :ios, "11.0"
  s.source        = { :git => "https://github.com/214AlphaDev/communitykitios" }
  s.source_files  = "CommunityKit/**/*.swift"
  s.framework     = "UIKit"
  s.dependency 'Apollo', '0.10.0'
  s.dependency 'Sodium', '0.8.0'
  s.dependency 'KeychainAccess', '3.1.2'
  s.dependency 'JWTDecode', '2.2.0'
  s.dependency 'RealmSwift', '3.20.0'
  s.dependency 'FlowKit', '0.0.2'
end
