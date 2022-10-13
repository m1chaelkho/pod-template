source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '13.0'
use_frameworks!
inhibit_all_warnings!

def module_dependency_pod
  #insert pod here if needed
end

target 'SandboxApp' do
  module_dependency_pod

  pod '${POD_NAME}', :path => '.'
end

target '${POD_NAME}' do
  module_dependency_pod

  target '${POD_NAME}Tests' do
    ${INCLUDED_PODS}
  end
end


post_install do |installer|
  installer.pods_project.targets.each do |target|
    if target.name == '${POD_NAME}'
      target.build_configurations.each do |config|
        config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = 13.0
        config.build_settings["EXCLUDED_ARCHS[sdk=iphonesimulator*]"] = "arm64"
      end
    end
  end
end
