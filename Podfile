# Uncomment the next line to define a global platform for your project
 platform :ios, '13.0'

target 'RookMotionFrancisco' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for RookMotionFrancisco
  pod 'JGProgressHUD', '2.2'
  pod 'LBTATools', '1.0.12'
  pod 'IQKeyboardManagerSwift', '6.5.6'
  pod 'Firebase/Auth'
  pod 'Firebase/Firestore'

end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
      config.build_settings['DEBUG_INFORMATION_FORMAT'] = 'dwarf'
    end
  end
end
