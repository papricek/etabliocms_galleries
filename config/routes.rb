Rails.application.routes.draw do

  scope :module => "etabliocms_galleries" do
    namespace :admin do
      resources :galleries do
        post :sort, :on => :collection
        post :sort_pictures, :on => :member
      end
    end
  end

end
