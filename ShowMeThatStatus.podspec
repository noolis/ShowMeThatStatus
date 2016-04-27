Pod::Spec.new do |s|

s.platform = :ios
s.ios.deployment_target = '9.0'
s.name = "ShowMeThatStatus"
s.summary = "This is a component written in Swift for iOS 9.0+ to display statuses of a process in a nicely animated manner."
s.requires_arc = true

s.version = "0.1.0"

s.license = { :type => "MIT", :file => "LICENSE" }

s.author = { "Tomasz Kopycki" => "t.kopycki@noolis.co" }

s.homepage = "https://github.com/wssj/ShowMeThatStatus"

s.source = { :git => "https://github.com/wssj/ShowMeThatStatus.git", :tag => "#{s.version}"}

s.framework = "UIKit"

s.source_files = "ShowMeThatStatus/**/*.{swift}"

s.resources = "ShowMeThatStatus/**/*.{png,jpeg,jpg,storyboard,xib}"

end