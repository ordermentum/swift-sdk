Pod::Spec.new do |s|
  s.name	= "OrdermentumSDK"
  s.version	= "0.0.1"
  s.summary	= "SwiftSDK that wraps the Ordermentum API."
  s.description	= "Ordermentum API functionality wrapped using Alamofire. Consumable by any Swift client."
  s.homepage	= "https://ordermentum.github.io/docs/"

  s.license      = "Apache-2.0"
  s.author             = { "Brandon Stillitano" => "brandon.stillitano@ordermentum.com" }

  s.ios.deployment_target = "10.0"
  s.osx.deployment_target = "10.12"
  s.watchos.deployment_target = "3.0"
  s.tvos.deployment_target = "10.0"

  s.source       = { git: "https://github.com/ordermentum/swift-sdk.git", tag: "0.0.1" }

  s.source_files  = "Classes", "Classes/**/*.{h,m}", "Models", "Routers", "Services", "Utilities", "OrdermentumSDK/**/*.{h,m,swift}"
  s.exclude_files = "Classes/Exclude"

  s.framework  = "OrdermentumSDK"

  s.dependency "Alamofire", "~> 5.0.0-beta.3"
  s.dependency "Hippolyte", "~> 0.6.0"

  s.swift_version = "4.2"
end
