# Addition

[![CI Status](http://img.shields.io/travis/CaiChenghan/Addition.svg?style=flat)](https://travis-ci.org/CaiChenghan/Addition)
[![Version](https://img.shields.io/cocoapods/v/Addition.svg?style=flat)](http://cocoapods.org/pods/Addition)
[![License](https://img.shields.io/cocoapods/l/Addition.svg?style=flat)](http://cocoapods.org/pods/Addition)
[![Platform](https://img.shields.io/cocoapods/p/Addition.svg?style=flat)](http://cocoapods.org/pods/Addition)

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

Addition is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'Addition', '~>0.2.5'
```

## Author

蔡成汉, 1178752402@qq.com

## License

Addition is available under the MIT license. See the LICENSE file for more info.


## 更新说明
- 0.2.5 增加Addition.h文件，方便多个扩展同时引用。
- 0.2.4 Addition扩展类集采用分层的Subspecs管理，各个分类的使用，需单独引入。
- 0.2.3 UIImage视图转图片对scrollView的支持，可截取整个scrollView页面。
- 0.2.2 UIImage增加视图转图片和图片裁剪方法；移除屏幕截取方法。
- 0.2.1 NSDictionary安全取值取不到时返回指定类型空数据，例如空字符串、空数组等，
- 0.2.0 iOS最低支持从8.0开始；UIView增加单击扩展；代码整理。
- 0.1.5 新增Base64加密解密方法。
- 0.1.4 修复NSDate的md5方法，原方法md5失败。
- 0.1.3 新增NSDate取时间间隔+(void)getSepTimeWithDay...方法。
- 0.1.2 新增NSString的encode和decode方法。
- 0.1.1 新增NSDate扩展，方便时间获取。
- 0.1.0 修复0.0.9字典取值类型错误问题。
- 0.0.9 修复0.0.8字典安全赋值书写错误。
