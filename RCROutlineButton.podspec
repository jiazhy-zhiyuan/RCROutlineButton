Pod::Spec.new do |s|
  s.name             = "RCROutlineButton"
  s.version          = "1.0.1"
  s.summary          = "An iOS UIButton subclass with an outline border whose colour matches that of the title label."
  s.homepage         = "https://github.com/robinsonrc/RCROutlineButton"
  s.license          = { :type => 'MIT', :file => 'LICENSE'  }
  s.author           = "Rich Robinson"
  s.source           = { :git => "https://github.com/robinsonrc/RCROutlineButton.git", :tag => s.version.to_s }

  s.platform     = :ios, '7.1'
  s.requires_arc = true

  s.source_files = ['RCROutlineButton/*.{h,m}']

  s.frameworks = 'UIKit'
end
