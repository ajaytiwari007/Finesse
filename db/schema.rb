# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110927070014) do

  create_table "ad_effect_on_consumers", :force => true do |t|
    t.integer  "consumer_id"
    t.integer  "media_id"
    t.integer  "ratio"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ad_indices", :force => true do |t|
    t.integer  "round_id"
    t.integer  "brand_id"
    t.integer  "ad_index"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "add_effects", :force => true do |t|
    t.integer  "media_id"
    t.integer  "ratio"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "assets", :force => true do |t|
    t.integer  "round_id"
    t.integer  "player_id"
    t.integer  "fixed_assets"
    t.integer  "investments"
    t.integer  "inventory"
    t.integer  "cash"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "brands", :force => true do |t|
    t.integer  "player_id"
    t.string   "name"
    t.integer  "product_type_id"
    t.integer  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "case_studies", :force => true do |t|
    t.string   "name"
    t.integer  "max_round"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "channel_incentive_for_rounds", :force => true do |t|
    t.integer  "channel_incentive_id"
    t.integer  "round_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "channel_incentives", :force => true do |t|
    t.string   "name"
    t.boolean  "incentive_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "channel_indices", :force => true do |t|
    t.integer  "round_id"
    t.integer  "brand_id"
    t.integer  "channel_index"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "dealer_id"
  end

  create_table "clients", :force => true do |t|
    t.string   "name"
    t.string   "client_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "consumer_demographics", :force => true do |t|
    t.integer  "dealer_id"
    t.integer  "consumer_type_id"
    t.integer  "ratio"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "consumer_selections", :force => true do |t|
    t.integer  "round_id"
    t.integer  "customer_id"
    t.boolean  "purchase"
    t.integer  "brand_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "consumer_types", :force => true do |t|
    t.string   "name"
    t.integer  "purchase_quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "consumers", :force => true do |t|
    t.integer  "dealer_id"
    t.string   "name"
    t.integer  "consumer_type_id"
    t.integer  "product_type_id"
    t.integer  "probability_of_purchase"
    t.integer  "ratio_of_ad"
    t.integer  "ratio_of_channel_push"
    t.integer  "ratio_of_price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dealers", :force => true do |t|
    t.string   "name"
    t.integer  "factory_id"
    t.integer  "consumer_catchment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "departments", :force => true do |t|
    t.string   "name"
    t.integer  "incentive_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "employee_demographics", :force => true do |t|
    t.integer  "case_study_id"
    t.integer  "employee_type_id"
    t.integer  "ratio"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "employee_expenses", :force => true do |t|
    t.integer  "round_id"
    t.integer  "player_id"
    t.integer  "employee_efficiency"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "employee_types", :force => true do |t|
    t.string   "name"
    t.integer  "cost"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "employees", :force => true do |t|
    t.string   "name"
    t.integer  "factory_id"
    t.integer  "employee_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "expense_for_rounds", :force => true do |t|
    t.integer  "round_id"
    t.integer  "expense_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "expenses", :force => true do |t|
    t.string   "name"
    t.integer  "department_id"
    t.integer  "value"
    t.boolean  "absolute"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "facilitator_groups", :force => true do |t|
    t.string   "name"
    t.integer  "facilitator_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "facilitators", :force => true do |t|
    t.string   "name"
    t.integer  "client_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "factories", :force => true do |t|
    t.string   "name"
    t.integer  "employee_count"
    t.integer  "capacity"
    t.integer  "distance_to_market"
    t.integer  "product_type_id"
    t.integer  "dealer_catchment"
    t.integer  "cost"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "factory_input_prices", :force => true do |t|
    t.integer  "round_id"
    t.integer  "factory_input_id"
    t.integer  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "factory_inputs", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hr_incentive_for_rounds", :force => true do |t|
    t.integer  "round_id"
    t.integer  "hr_incentive_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hr_incentives", :force => true do |t|
    t.string   "name"
    t.boolean  "active"
    t.integer  "cost"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "incentive_effect_on_dealers", :force => true do |t|
    t.integer  "dealer_id"
    t.integer  "channel_incentive_id"
    t.integer  "ratio"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "investment_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "investments", :force => true do |t|
    t.integer  "round_id"
    t.integer  "player_id"
    t.integer  "investment_type_id"
    t.integer  "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "liabilities", :force => true do |t|
    t.integer  "round_id"
    t.integer  "player_id"
    t.integer  "long_term_loans"
    t.integer  "short_term_loans"
    t.integer  "net_worth"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "loans", :force => true do |t|
    t.integer  "round_id"
    t.integer  "player_id"
    t.integer  "amount"
    t.decimal  "rate"
    t.integer  "start_round_id"
    t.integer  "end_round_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "macro_indicator_for_rounds", :force => true do |t|
    t.integer  "round_id"
    t.integer  "macro_indicator_option_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "macro_indicator_options", :force => true do |t|
    t.integer  "macro_indicator_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "macro_indicators", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "media", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "player_factories", :force => true do |t|
    t.integer  "player_id"
    t.integer  "factory_id"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "players", :force => true do |t|
    t.string   "name"
    t.integer  "student_group_user_id"
    t.integer  "case_study_id"
    t.integer  "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pnls", :force => true do |t|
    t.integer  "round_id"
    t.integer  "player_id"
    t.integer  "income"
    t.integer  "cogs"
    t.integer  "employee_cost"
    t.integer  "sga"
    t.integer  "ebitda"
    t.integer  "interest"
    t.integer  "inv_income"
    t.integer  "depreciation"
    t.integer  "pbt"
    t.integer  "tax"
    t.integer  "pat"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_indices", :force => true do |t|
    t.integer  "round_id"
    t.integer  "brand_id"
    t.integer  "price_index"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "product_compositions", :force => true do |t|
    t.integer  "product_type_id"
    t.integer  "factory_input_id"
    t.integer  "ratio"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "weight"
  end

  create_table "product_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "productions", :force => true do |t|
    t.integer  "round_id"
    t.integer  "player_id"
    t.boolean  "active"
    t.integer  "quantity"
    t.integer  "production_cost"
    t.integer  "factory_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "question_options", :force => true do |t|
    t.integer  "question_id"
    t.text     "option"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "questions", :force => true do |t|
    t.text     "question"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "range_specifications", :force => true do |t|
    t.integer  "min_effect_of_hr_incentive"
    t.integer  "max_effect_of_hr_incentive"
    t.integer  "min_effect_of_channel_incentive"
    t.integer  "max_effect_of_channel_incentive"
    t.integer  "min_effect_of_media"
    t.integer  "max_effect_of_media"
    t.integer  "min_dealer_catchment"
    t.integer  "max_dealer_catchment"
    t.integer  "min_consumer_catchment"
    t.integer  "max_consumer_catchment"
    t.integer  "min_employee_count"
    t.integer  "max_employee_count"
    t.integer  "min_consumer_demographics"
    t.integer  "max_consumer_demographics"
    t.integer  "min_probability_of_purchase"
    t.integer  "max_probability_of_purchase"
    t.integer  "min_effect_of_price"
    t.integer  "max_effect_of_price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.integer  "case_study_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "round_expenses", :force => true do |t|
    t.integer  "round_id"
    t.integer  "expense_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rounds", :force => true do |t|
    t.string   "name"
    t.integer  "case_study_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sales", :force => true do |t|
    t.integer  "round_id"
    t.integer  "brand_id"
    t.integer  "volume"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "selected_channel_incentives", :force => true do |t|
    t.integer  "channel_incentive_for_round_id"
    t.integer  "brand_id"
    t.boolean  "active"
    t.integer  "value"
    t.integer  "channel_incentive_cost"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "selected_expense_for_rounds", :force => true do |t|
    t.integer  "expense_for_round_id"
    t.integer  "player_id"
    t.boolean  "active"
    t.integer  "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "selected_hr_incentives", :force => true do |t|
    t.integer  "player_id"
    t.boolean  "active"
    t.integer  "value"
    t.integer  "hr_incentive_cost"
    t.integer  "hr_incentive_for_round_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "selected_media", :force => true do |t|
    t.integer  "round_id"
    t.integer  "brand_id"
    t.integer  "media_id"
    t.boolean  "active"
    t.integer  "advertising_cost"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "student_group_case_studies", :force => true do |t|
    t.integer  "student_group_id"
    t.integer  "case_study_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "student_group_surveys", :force => true do |t|
    t.integer  "student_group_id"
    t.integer  "survey_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "student_group_users", :force => true do |t|
    t.integer  "student_group_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "student_groups", :force => true do |t|
    t.integer  "facilitator_group_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "case_study_id"
  end

  create_table "survey_positions", :force => true do |t|
    t.string   "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "survey_questions", :force => true do |t|
    t.integer  "survey_id"
    t.integer  "question_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "survey_responses", :force => true do |t|
    t.integer  "player_id"
    t.integer  "student_group_survey_id"
    t.integer  "question_option_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "surveys", :force => true do |t|
    t.string   "name"
    t.integer  "survey_position_id"
    t.integer  "facilitator_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "uploads", :force => true do |t|
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "username"
    t.integer  "facilitator_group_id"
    t.boolean  "admin"
    t.boolean  "facilitator"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
