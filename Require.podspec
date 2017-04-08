Pod::Spec.new do |s|
  s.name         = "Require"
  s.version      = "1.0.1"
  s.summary      = "Require optional values to be non-nil, or crash gracefully"
  s.description  = <<-DESC
    Easily require optional values to be non-nil, or crash gracefully
  DESC
  s.homepage     = "https://github.com/johnsundell/require"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "John Sundell" => "john@sundell.co" }
  s.social_media_url   = "https://twitter.com/johnsundell"
  s.ios.deployment_target = "8.0"
  s.osx.deployment_target = "10.9"
  s.watchos.deployment_target = "2.0"
  s.tvos.deployment_target = "9.0"
  s.source       = { :git => "https://github.com/johnsundell/require.git", :tag => s.version.to_s }
  s.source_files  = "Sources/**/*"
  s.frameworks  = "Foundation"
end
