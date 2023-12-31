
Pod::Spec.new do |s|

  s.name         = "SFAdSigmobAdapter"
  s.version      = "2.7.1.8" # 版本号
  s.summary      = "SFAdSigmobAdapter is a AD SDK Adapter."
  s.description  = <<-DESC
                   ‘Mediatom provides Union ADs which include native、banner、feed、RewardVideo etc..’
                   DESC
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "小富" => "3290235031@qq.com" }

  s.homepage     = "https://github.com/xiaofu666/MSaas"
  s.source       = { :git => "https://github.com/xiaofu666/MSaas.git", :tag => s.version.to_s }

  s.platform     = :ios, "9.0"
  s.ios.deployment_target = '9.0'

  s.frameworks = 'AssetsLibrary', 'MapKit', 'JavaScriptCore', 'StoreKit', 'MobileCoreServices', 'WebKit', 'MediaPlayer', 'CoreMedia', 'AVFoundation', 'CoreLocation', 'CoreTelephony', 'SystemConfiguration', 'AdSupport', 'CoreMotion', 'Security', 'QuartzCore', 'CoreGraphics', 'SafariServices', 'UIKit', 'Foundation', 'AppTrackingTransparency'
  s.libraries = 'c++', 'c++abi', 'resolv', 'xml2', 'bz2', 'z', 'iconv', 'sqlite3'

  s.vendored_frameworks =  'MSaasSDK/Frameworks/SFAdSigmobAdapter.framework'
  
  s.xcconfig = { "OTHER_LDFLAGS" => "-ObjC" }
  s.pod_target_xcconfig = { 'VALID_ARCHS[sdk=iphonesimulator*]' => '' }

  s.dependency 'SigmobAd-iOS', '4.9.3'
  
end
