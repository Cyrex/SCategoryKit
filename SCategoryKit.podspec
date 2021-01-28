#
# Be sure to run `pod lib lint SCategoryKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SCategoryKit'
  s.version          = '1.0.8'
  s.summary          = 'a collection of useful Objective-C Categories.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
a collection of useful Objective-C Categories extending iOS Frameworks.
                       DESC

  s.homepage         = 'https://github.com/Cyrex/SCategoryKit'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'szwathub' => 'szwathub@gmail.com' }
  s.source           = { :git => 'https://github.com/szwathub/SCategoryKit.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.public_header_files = 'SCategoryKit/SCategoryKit.h'
  s.source_files = 'SCategoryKit/SCategoryKit.h'
  
  # UIKit
  s.subspec 'UIKit' do |uikit|
      uikit.public_header_files = 'SCategoryKit/UIKit/SUIKit.h'
      uikit.source_files = 'SCategoryKit/UIKit/SUIKit.h'
      uikit.frameworks = 'UIKit'

      uikit.subspec 'UIPageViewController' do |pageViewController|
          pageViewController.source_files = 'SCategoryKit/UIKit/UIPageViewController/*.{h,m}'
      end
      
      uikit.subspec 'UIImage' do |image|
          image.source_files = 'SCategoryKit/UIKit/UIImage/*.{h,m}'
      end
      
      uikit.subspec 'UIButton' do |button|
          button.source_files = 'SCategoryKit/UIKit/UIButton/*.{h,m}'
      end
      
      uikit.subspec 'UIColor' do |color|
          color.source_files = 'SCategoryKit/UIKit/UIColor/*.{h,m}'
      end
      
      uikit.subspec 'UIView' do |view|
          view.source_files = 'SCategoryKit/UIKit/UIView/*.{h,m}'
      end
  end
  
  # Foundation
  s.subspec 'Foundation' do |foundation|
      foundation.public_header_files = 'SCategoryKit/Foundation/SFoundation.h'
      foundation.source_files = 'SCategoryKit/Foundation/SFoundation.h'
      foundation.frameworks = 'Foundation'
      
      foundation.subspec 'NSBundle' do |bundle|
          bundle.source_files = 'SCategoryKit/Foundation/NSBundle/*.{h,m}'
      end
  end
end
