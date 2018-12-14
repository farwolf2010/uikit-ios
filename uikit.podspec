Pod::Spec.new do |s| 
  s.name = 'uikit' 
  s.version = '2.11.2' 
  s.summary = 'Netease IM UI Kit' 
  s.homepage = 'http://netease.im' 
  s.license = { :'type' => 'Copyright', :'text' => ' Copyright 2017 Netease '} 
  s.authors = 'Netease IM Team'  
  s.source  = { :path => '.'}  
  s.platform = :ios, '8.0' 
  s.frameworks = 'CoreText', 'SystemConfiguration', 'AVFoundation', 'CoreTelephony', 'AudioToolbox', 'CoreMedia' , 'VideoToolbox' 
  s.libraries  = 'sqlite3.0', 'z', 'c++' 
  s.subspec 'Full' do |cs|	
    cs.source_files = 'NIMKit/**/*.{h,m}' 
    cs.dependency 'NIMKit/Core' 
    cs.dependency 'NIMSDK', '~> 5.9.0' 
    s.dependency 'farwolf'
  end 

  s.subspec 'Lite' do |cs|  
    cs.source_files = 'NIMKit/**/*.{h,m}'  
    cs.dependency 'NIMKit/Core'  
    cs.dependency 'NIMSDK_LITE'
  end  

  s.subspec 'Core' do |os|     
    os.resources = 'Resources/*.*'   
    os.dependency 'SDWebImage', '~> 4.2.2'  
    os.dependency 'Toast', '~> 3.0'         
    os.dependency 'M80AttributedLabel', '~> 1.6.3'       
    os.dependency 'TZImagePickerController', '~> 1.9.0'  
  end   

  s.default_subspec = 'Lite'  

end 
