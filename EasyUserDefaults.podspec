Pod::Spec.new do |spec|
  spec.name             = 'EasyUserDefaults'
  spec.version          = '0.0.1'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.summary          = 'Easy save data to UserDefaults'
  spec.homepage         = 'https://github.com/ashi-psn/EasyUserDefaults'
  spec.author           = { 'ashi-psn' => 'psn.arcz.vtzf@gmail.com' }
  spec.source           = { :git => 'https://github.com/ashi-psn/EasyUserDefaults.git', :tag => spec.version.to_s }
  spec.source_files     = 'Sources/**/*.swift'
  spec.swift_versions   = ['5.1', '5.2', '5.3', '5.4', '5.5', '5.6']
  spec.framework        = 'Foundation'

  spec.ios.deployment_target     = '9.0'
  spec.osx.deployment_target     = '10.11'
  spec.tvos.deployment_target    = '9.0'
  spec.watchos.deployment_target = '2.0'
end
