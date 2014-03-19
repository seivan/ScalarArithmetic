Pod::Spec.new do |s|
  name           = "SHPresenterBlocks"
  url            = "https://github.com/seivan/#{name}"
  git_url        = "#{url}.git"
  s.name         = name
  version        = "1.0.0"
  source_files   = "#{name}/**/*.{h,m}"

  s.version      = version
  s.summary      = "Presentation Manager for ViewControllers"
  s.description  = <<-DESC

                    * Manage controller presentations
                    * Handle presented controllers 
                    * Queue presented controllers
                    * Dismiss all presented controllers
                    * Can be used to make progress handlers and modals
                    * Well-tested and light weight
                    * Easy selectors to get started quickly. 
                    
                    DESC

  s.homepage     = url
  s.license      = 'MIT'
  s.author       = { "Seivan Heidari" => "seivan.heidari@icloud.com" }
  
  s.source       = { :git => git_url, :tag => version}
  
  
  s.platform  = :ios, "7.0"

  s.source_files = source_files
  s.resources    = "#{name}/**/*.{private}"

  s.requires_arc = true
  s.social_media_url = 'https://twitter.com/seivan'



end
