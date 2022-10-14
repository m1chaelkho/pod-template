source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '13.0'
use_frameworks! :linkage => :static
inhibit_all_warnings!

install! 'cocoapods',
:generate_multiple_pod_projects => true,
:incremental_installation => true

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
    if target.respond_to?(:product_type) and target.product_type == "com.apple.product-type.bundle"
      target.build_configurations.each do |config|
          config.build_settings['CODE_SIGNING_ALLOWED'] = 'NO'
      end
    end
  end
end