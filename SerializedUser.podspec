Pod::Spec.new do |spec|
  spec.name         = 'SerializedUser'
  spec.version      = '1.0.0'
  spec.summary      = 'Serialize user with NSUserDefaults and save sensitive token with SSKeychain'
  spec.homepage     = 'https://github.com/xinminlabs/SerializedUser'
  spec.author       = { 'Richard Huang' => 'flyerhzm@gmail.com' }
  spec.source       = { :git => 'https://github.com/xinminlabs/SerializedUser.git', :tag => "v#{spec.version}" }
  spec.source_files = 'SerializedUser/*.{h,m}'
  spec.requires_arc = true
  spec.license      = { :type => 'MIT', :file => 'LICENSE' }
  spec.requires_arc = true

  spec.dependency 'SSKeychain'
end
