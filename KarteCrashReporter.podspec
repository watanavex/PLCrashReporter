#
#  Be sure to run `pod spec lint KarteCrashReporter.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|
  spec.name         = "KarteCrashReporter"
  spec.version      = "1.8.1"
  spec.summary      = "Fork of the Plausible Labs PLCrashReporter repo."
  spec.description  = "This fork contains code that is not part of the core PLCrashReporter distribution.  This software is not provided by or maintained by Plausible Labs."

  spec.homepage     = "https://github.com/plaidev/PLCrashReporter"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "PLAID" => "dev.share@plaid.co.jp" }
  spec.platform     = :ios, "9.0"

  spec.source       = { :git => "https://github.com/plaidev/PLCrashReporter.git", :tag => "#{spec.version}-patch" }
  spec.vendored_frameworks = "CrashReporter.xcframework"
  spec.pod_target_xcconfig = {
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64'
  }
  spec.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
end
