#
# Be sure to run `pod lib lint SwiftUIWheelPicker.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SwiftUIWheelPicker'
  s.version          = '1.0.0'
  s.summary          = 'Horizontal wheel picker for SwiftUI'
  s.homepage         = 'https://github.com/ggjjack/SwiftUIWheelPicker'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'ggaljjak' => 'ggaljjak.choi@gmail.com' }
  s.source           = { :git => 'https://github.com/ggjjack/SwiftUIWheelPicker.git', :tag => s.version.to_s }
  s.swift_versions   = '4.0'
  # s.swift_versions = ['5.3', '5.4', '5.5']
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '13.0'

  s.source_files = 'SwiftUIWheelPicker/Classes/**/*'
  
  # s.resource_bundles = {
  #   'SwiftUIWheelPicker' => ['SwiftUIWheelPicker/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
