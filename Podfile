require_relative '../../scripts/pod_post_install'

source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '12.0'
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
  
  # Add Exclude Arch for arm64
  setup_pod_projects_build_config(installer)
end