OmniAuth.config.logger = Rails.logger


Rails.application.config.middleware.use OmniAuth::Builder do
    
    
    
    if Rails.env.production?
        provider :production if Rails.env.production? 
        provider :facebook , '1438381289635819', 'dccd0d31a98e1361e4ae69c6bf01f0c2'
    else
        provider :developer if Rails.env.development?
        provider :github, '2060b14d94c254653210', '36d8c492e7905333ab5894c5bddb34c0081b4b50',
        { :name => "github", :scope => ['read:user', 'user:email']}
        provider :facebook, '304395997120017', '49771f2ecfbae1e4d8926649cf50c393'
    end
end