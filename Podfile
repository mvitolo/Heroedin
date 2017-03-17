source 'https://github.com/CocoaPods/Specs.git'
use_frameworks!
platform :ios, '10.0'

def shared_pods
    pod 'Alamofire', '~> 4.3'
    pod 'SwiftyJSON'
    pod 'CocoaLumberjack/Swift', '~> 3.0.0'
    pod 'CryptoSwift'
    pod 'SDWebImage/WebP'
end

def testing_pods
    pod 'Mockingjay'
    pod 'Quick'
    pod 'Nimble'
end


target 'Heroedin' do
    shared_pods
end

target 'HeroedinTests' do
    shared_pods
    testing_pods
end
