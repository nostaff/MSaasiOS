
Pod::Spec.new do |s|

  s.name         = "SFAdBaiduAdapter"
  s.version      = "2.5.5.1" # 版本号
  s.summary      = "SFAdBaiduAdapter is a AD SDK Adapter."
  s.description  = <<-DESC
                   ‘CloudDragonfly provides Union ADs which include native、banner、feed、splash、RewardVideo etc..’
                   DESC
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "小富" => "3290235031@qq.com" }

  s.homepage     = "https://github.com/xiaofu666/MSaas"
  s.source       = { :git => "https://github.com/xiaofu666/MSaas.git", :tag => s.version.to_s }

  s.platform     = :ios, "9.0"
  s.ios.deployment_target = '9.0'

  s.frameworks = 'AssetsLibrary', 'MapKit', 'JavaScriptCore', 'StoreKit', 'MobileCoreServices', 'WebKit', 'MediaPlayer', 'CoreMedia', 'AVFoundation', 'CoreLocation', 'CoreTelephony', 'SystemConfiguration', 'AdSupport', 'CoreMotion', 'Security', 'QuartzCore', 'CoreGraphics', 'SafariServices', 'UIKit', 'Foundation', 'AppTrackingTransparency'
  s.libraries = 'c++', 'c++abi', 'resolv', 'xml2', 'bz2', 'z', 'iconv', 'sqlite3'

  s.vendored_frameworks =  'MSaasSDK/Frameworks/SFAdBaiduAdapter.framework'
  
  s.xcconfig = { "OTHER_LDFLAGS" => "-ObjC" }
  s.pod_target_xcconfig = { 'VALID_ARCHS[sdk=iphonesimulator*]' => '' }

  s.dependency 'BaiduMobAdSDK'
  
end