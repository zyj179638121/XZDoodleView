Pod::Spec.new do |s|

  s.name         = "XZDoodleView"
  s.version      = "1.2"
  s.summary      = "XZDoodleView."

  s.description  = <<-DESC
                    this is XZDoodleView
                   DESC

  s.homepage     = "https://github.com/zyj179638121/XZDoodleView"

  s.license      = { :type => "MIT", :file => "FILE_LICENSE" }

  s.author       = { "zyj179638121" => "179638121@qq.com" }

  s.platform     = :ios, "8.0"

  s.source       = { :git => "https://github.com/zyj179638121/XZDoodleView.git", :tag => s.version.to_s }

  s.source_files  = "XZDoodleView/XZDoodleView/*.{h,m}"

  s.requires_arc = true

  s.dependency "Masonry"

end
