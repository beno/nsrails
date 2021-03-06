Pod::Spec.new do |s|
  s.name         = "NSRails"
  s.version      = "2.2"
  s.summary      = "iOS/Mac OS framework for Rails."
  s.homepage     = "https://github.com/dingbat/nsrails"
  s.license      = { :type => 'Copyright (c) 2014 Dan Hassin', :file => 'license.md' }
  s.author       = { "Dan Hassin" => "danhassin@mac.com" }
  s.source       = { :git => "https://github.com/dingbat/nsrails.git", :tag => "v2.2" }

  s.ios.deployment_target = '5.0'
  s.osx.deployment_target = '10.7'

  s.framework  = 'CoreData'
  s.requires_arc = true

  s.default_subspec = 'NSRails'

  s.subspec 'NSRails' do |ncd|
    ncd.source_files = 'source/*.{h,m}'
    ncd.exclude_files = "source/NSRRemoteManagedObject.{h,m}"
  end

  s.subspec 'CoreData' do |cd|
    cd.dependency 'NSRails/NSRails'
    cd.source_files = 'source/*.{h,m}'
    cd.xcconfig = {"GCC_PREPROCESSOR_DEFINITIONS" => "NSR_USE_COREDATA"}
  end
end
