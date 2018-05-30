# == Route Map
#
#                    Prefix Verb   URI Pattern                                                                              Controller#Action
#        new_author_session GET    /authors/sign_in(.:format)                                                               devise/sessions#new
#            author_session POST   /authors/sign_in(.:format)                                                               devise/sessions#create
#    destroy_author_session DELETE /authors/sign_out(.:format)                                                              devise/sessions#destroy
#       new_author_password GET    /authors/password/new(.:format)                                                          devise/passwords#new
#      edit_author_password GET    /authors/password/edit(.:format)                                                         devise/passwords#edit
#           author_password PATCH  /authors/password(.:format)                                                              devise/passwords#update
#                           PUT    /authors/password(.:format)                                                              devise/passwords#update
#                           POST   /authors/password(.:format)                                                              devise/passwords#create
#                      root GET    /                                                                                        blog/posts#index
#             authors_posts GET    /authors/posts(.:format)                                                                 authors/posts#index
#                           POST   /authors/posts(.:format)                                                                 authors/posts#create
#          new_authors_post GET    /authors/posts/new(.:format)                                                             authors/posts#new
#         edit_authors_post GET    /authors/posts/:id/edit(.:format)                                                        authors/posts#edit
#              authors_post GET    /authors/posts/:id(.:format)                                                             authors/posts#show
#                           PATCH  /authors/posts/:id(.:format)                                                             authors/posts#update
#                           PUT    /authors/posts/:id(.:format)                                                             authors/posts#update
#                           DELETE /authors/posts/:id(.:format)                                                             authors/posts#destroy
#                     about GET    /about(.:format)                                                                         blog/pages#about
#                   contact GET    /contact(.:format)                                                                       blog/pages#contact
#                     posts GET    /posts(.:format)                                                                         blog/posts#index
#                      post GET    /posts/:id(.:format)                                                                     blog/posts#show
#        rails_service_blob GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
# rails_blob_representation GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
#        rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
# update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
#      rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create

Rails.application.routes.draw do
 
  devise_for :authors
  root to: 'blog/posts#index'

  namespace :authors do
    resources :posts do
      put 'publish' => 'posts#publish' ,on: :member 
      put 'unpublish'=> 'posts#unpublish' ,on: :member 
    end
   
  end

  scope module: 'blog' do
  get 'about' => 'pages#about', as: :about
  get 'contact' => 'pages#contact', as: :contact
  get 'posts' => 'posts#index', as: :posts
  get 'posts/:id' => 'posts#show', as: :post
  
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
