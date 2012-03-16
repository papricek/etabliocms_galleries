Rails.application.routes.draw do

  scope :module => "etabliocms_galleries" do
    namespace :admin do
      resources :galleries do
        collection do
          post :sort
        end
      end
    end
  end

end
