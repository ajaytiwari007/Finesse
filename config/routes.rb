FinnesePractice::Application.routes.draw do
  resources :range_specifications

  resources :add_effects
  
  get "welcome/index"

  devise_for :users do
  get "/users/sign_out" => "devise/sessions#destroy", :as => :destroy_user_session
end

  resources :macro_indicator_for_rounds

  resources :macro_indicator_options

  resources :macro_indicators

  resources :round_expenses

  resources :student_group_case_studies

  resources :players

  resources :selected_expense_for_rounds

  resources :expense_for_rounds

  resources :departments

  resources :expenses

  resources :rounds

  resources :roles

  resources :case_studies

  resources :student_group_users

  resources :student_groups

  resources :facilitator_groups

  resources :facilitators

  resources :clients

  get "select_brand/index"


  resources :survey_responses

    resources :student_group_surveys

    resources :survey_questions

    resources :question_options

    resources :questions

    resources :surveys

    resources :survey_positions

    resources :price_indices

    resources :brands

    resources :product_compositions

    resources :product_types

    resources :selected_channel_incentives

    resources :channel_incentive_for_rounds

    resources :sales

    resources :consumer_selections

    resources :channel_indices

    resources :uploads

    resources :channel_incentives

    resources :ad_indices

    resources :ad_effect_on_consumers

    resources :selected_media

    resources :media

    resources :consumers

    resources :consumer_types

    resources :incentive_effect_on_dealers

    resources :consumer_demographics

    resources :dealers

    resources :factories

    resources :welcome

    resources :assets

    resources :liabilities

    resources :loans

    resources :investment_types

    resources :investments

    resources :factory_input_prices

    resources :pnls

    resources :hr_incentive_for_rounds

    resources :selected_hr_incentives

    resources :hr_incentives

    resources :players

    resources :player_factories

    resources :productions

    resources :factory_inputs

   resources :employee_demographics

  resources :employees

  resources :employee_types

  resources :employee_expenses

  resources :expenses

  match 'get_production'=>"productions#get_production"

  match 'calculate_channel_index'=>'channel_indices#calculate_channel_index'

  match 'delete_all_channel_indices'=>"channel_indices#delete_all_channel_indices"

  match 'calculate_ad_index'=>'ad_indices#calculate_ad_index'

  match 'delete_all_ad_indices'=>"ad_indices#delete_all_ad_indices"

  match 'delete_all_consumer_selections' => 'consumer_selections#delete_all_consumer_selections'

  match 'calculate_consumer_selection' => 'consumer_selections#calculate_consumer_selection'

  match 'calculate_price_index'=>'price_indices#calculate_price_index'

  match 'delete_all_price_indices'=>"price_indices#delete_all_price_indices"

  match 'delete_all_sales'=>'sales#delete_all_sales'

  match 'get_sales'=>'sales#get_sales'

  match 'On_Select_Brand'=>'select_brand#On_Select_Brand'

  match 'mod_db'=>'player_factories#mod_db'

  match 'redirection'=>'welcome#redirection'

  match 'buy_factory'=>'player_factories#buy_factory'

   match 'manual_new'=>'pnls#manual_new'
  
  
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
   root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
