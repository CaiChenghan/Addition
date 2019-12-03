#
# Be sure to run `pod lib lint Addition.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "Addition"
  s.version          = "1.2.0"
  s.summary          = "iOS扩展类集"
  s.description      = <<-DESC
                        iOS扩展类集，方便开发。
                       DESC
  s.homepage         = "https://github.com/CaiChenghan/Addition"
  s.license          = 'MIT'
  s.author           = { "蔡成汉" => "1178752402@qq.com" }
  s.source           = { :git => "https://github.com/CaiChenghan/Addition.git", :tag => s.version.to_s }
  s.platform     = :ios, '8.0'
  s.requires_arc = true
  s.source_files = 'Addition/Addition.h'
  s.subspec 'NSData' do |ss|
      ss.source_files  = "Addition/NSData+Addition.{h,m}"
  end
  
  s.subspec 'NSDictionary' do |ss|
      ss.source_files  = "Addition/NSDictionary+Addition.{h,m}"
  end
  
  s.subspec 'NSDictionary' do |ss|
      ss.source_files  = "Addition/NSDictionary+Addition.{h,m}"
  end
  
  s.subspec 'NSMutableDictionary' do |ss|
      ss.source_files  = "Addition/NSMutableDictionary+Addition.{h,m}"
  end
  
  s.subspec 'NSArray' do |ss|
      ss.source_files  = "Addition/NSArray+Addition.{h,m}"
  end
  
  s.subspec 'NSDate' do |ss|
      ss.source_files  = "Addition/NSDate+Addition.{h,m}"
  end
  
  s.subspec 'NSString' do |ss|
      ss.source_files  = "Addition/NSString+Addition.{h,m}"
      ss.dependency 'Addition/NSData'
  end
  
  s.subspec 'NSObject' do |ss|
      ss.source_files  = "Addition/NSObject+Addition.{h,m}"
      ss.dependency 'Addition/NSString'
  end
  
  s.subspec 'UIColor' do |ss|
      ss.source_files  = "Addition/UIColor+Addition.{h,m}"
  end
  
  s.subspec 'UIImage' do |ss|
      ss.source_files  = "Addition/UIImage+Addition.{h,m}"
  end
  
  s.subspec 'UIView' do |ss|
      ss.source_files  = "Addition/UIView+Addition.{h,m}"
  end
  
  s.subspec 'UIFont' do |ss|
      ss.source_files  = "Addition/UIFont+Addition.{h,m}"
  end
  
  s.subspec 'UIScrollView' do |ss|
      ss.source_files  = "Addition/UIScrollView+Addition.{h,m}"
  end
  
end
