
Pod::Spec.new do |s|

  s.name         = "MSaas"
  s.version      = "2.7.1.8" # 版本号
  s.summary      = "MSaas is a SDK from Mediatom providing union AD service."
  s.description  = <<-DESC
                   ‘Mediatom provides Union ADs which include native、banner、feed、splash、RewardVideo etc..’
                   DESC
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "小富" => "3290235031@qq.com" }

  s.homepage     = "https://github.com/xiaofu666/MSaas"
  s.source       = { :git => "https://github.com/xiaofu666/MSaas.git", :tag => s.version.to_s }

  s.platform     = :ios, "9.0"
  s.ios.deployment_target = '9.0'

  s.frameworks = 'AssetsLibrary', 'MapKit', 'JavaScriptCore', 'StoreKit', 'MobileCoreServices', 'WebKit', 'MediaPlayer', 'CoreMedia', 'AVFoundation', 'CoreLocation', 'CoreTelephony', 'SystemConfiguration', 'AdSupport', 'CoreMotion', 'Security', 'QuartzCore', 'CoreGraphics', 'SafariServices', 'UIKit', 'Foundation', 'AppTrackingTransparency', 'DeviceCheck'
  s.libraries = 'c++', 'c++abi', 'resolv', 'xml2', 'bz2', 'z', 'iconv', 'sqlite3'

  s.vendored_frameworks =  'MSaasSDK/Frameworks/MSaas.framework'
  
  s.xcconfig = { "OTHER_LDFLAGS" => "-ObjC" }
  
end
