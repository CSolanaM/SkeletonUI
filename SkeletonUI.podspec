Pod::Spec.new do |s|
  s.name             = 'SkeletonUI'
  s.version          = '1.0.4'
  s.summary          = 'Elegant skeleton loading animation in SwiftUI and Combine'
  s.description      = <<-DESC
SkeletonUI aims to bring an elegant, declarative syntax to skeleton loading animations. Get rid of loading screens or spinners and start using skeletons to represent final content shapes
                       DESC
  s.homepage         = 'https://github.com/CSolanaM/SkeletonUI'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'CSolanaM' => 'carlos.solana.martinez@gmail.com' }
  s.source           = { :git => 'https://github.com/CSolanaM/SkeletonUI.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/CSolanaM'
  s.ios.deployment_target = '13.0'
  s.tvos.deployment_target = '13.0'
  s.watchos.deployment_target = '6.0'
  s.macos.deployment_target = '10.15'
  s.swift_version = '5.0'
  s.source_files = 'Sources/SkeletonUI/**/*'
end
