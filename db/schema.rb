# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120223204144) do

  create_table "cart_rows", :force => true do |t|
    t.integer   "cart_id"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.integer   "product_type_id"
    t.integer   "quantity"
  end

  add_index "cart_rows", ["cart_id"], :name => "index_cart_rows_on_cart_id"

  create_table "carts", :force => true do |t|
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.string    "price_name"
    t.integer   "user_id"
  end

  create_table "credits", :force => true do |t|
    t.integer   "purchase_id"
    t.integer   "user_id"
    t.integer   "paid_to_user_id"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "deliveries", :force => true do |t|
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.integer   "product_type_id"
    t.integer   "quantity"
    t.integer   "user_id"
    t.integer   "products_count",  :default => 0
  end

  add_index "deliveries", ["product_type_id"], :name => "index_deliveries_on_product_type_id"

  create_table "product_categories", :force => true do |t|
    t.string    "name"
    t.string    "color"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "product_type_relations", :force => true do |t|
    t.integer   "parent_id"
    t.integer   "child_id"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "product_types", :force => true do |t|
    t.string    "name"
    t.text      "description"
    t.decimal   "standard_price"
    t.decimal   "crew_price"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.decimal   "purchase_price"
    t.integer   "products_count",      :default => 0
    t.integer   "cart_rows_count",     :default => 0
    t.integer   "deliveries_count",    :default => 0
    t.integer   "product_category_id"
  end

  create_table "products", :force => true do |t|
    t.integer   "product_type_id"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.integer   "purchase_id"
    t.integer   "delivery_id"
    t.decimal   "sold_for_price"
    t.decimal   "purchase_price"
    t.integer   "sold_in_special_offer_id"
  end

  add_index "products", ["delivery_id"], :name => "index_products_on_delivery_id"
  add_index "products", ["product_type_id"], :name => "index_products_on_product_type_id"
  add_index "products", ["purchase_id"], :name => "index_products_on_purchase_id"

  create_table "purchases", :force => true do |t|
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.integer   "cart_id"
    t.string    "price_name"
    t.integer   "user_id"
    t.integer   "products_count", :default => 0
  end

  add_index "purchases", ["cart_id"], :name => "index_purchases_on_cart_id"

  create_table "users", :force => true do |t|
    t.string    "login",                     :limit => 40
    t.string    "name",                      :limit => 100, :default => ""
    t.string    "email",                     :limit => 100
    t.string    "crypted_password",          :limit => 40
    t.string    "salt",                      :limit => 40
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.string    "remember_token",            :limit => 40
    t.timestamp "remember_token_expires_at"
    t.integer   "bls_id"
    t.integer   "deliveries_count",                         :default => 0
    t.integer   "purchases_count",                          :default => 0
    t.integer   "carts_count",                              :default => 0
    t.integer   "credits_count",                            :default => 0
    t.integer   "coins",                                    :default => 0
    t.integer   "entry_code"
  end

  add_index "users", ["login"], :name => "index_users_on_login", :unique => true

end
