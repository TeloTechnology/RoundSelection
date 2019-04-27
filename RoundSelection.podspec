Pod::Spec.new do |spec|

  spec.name         = "RoundSelection"
  spec.version      = "0.0.1"
  spec.summary      = "A CocoaPods library written in Swift."

  spec.description  = <<-DESC
  This RoundSelection library helps you to do round selection.
                     DESC
  
  spec.homepage     = "http://telotechnology.com"
 
  spec.license      = "MIT"
  spec.author             = { "rudiluis" => "rudi.luis@telotechnology.com" }
  spec.social_media_url   = "https://www.instagram.com/telotechnology/"

  spec.ios.deployment_target = "12.1"
  spec.swift_version = "5"

  spec.source       = { :git => "https://github.com/TeloTechnology/RoundSelection.git", :tag => "#{spec.version}" }
  spec.source_files  = "RoundSelection/**/*.{h,m,swift}"
  spec.resources = 'RoundSelection/**/*.{nib,xib,storyboard,font,png,jpeg,jpg,svg,json,strings}'

  spec.dependency "RxSwift"
  spec.dependency "RxCocoa"
  spec.dependency "RxGesture"

end
