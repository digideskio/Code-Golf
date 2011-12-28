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

ActiveRecord::Schema.define(:version => 20111228125623) do

  create_table "problems", :force => true do |t|
    t.string    "title"
    t.text      "description"
    t.integer   "par_score"
    t.boolean   "current_problem", :default => true
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.string    "language"
    t.text      "sample_output"
    t.timestamp "deadline"
    t.string    "comment"
  end

  create_table "submissions", :force => true do |t|
    t.integer   "user_id"
    t.integer   "problem_id"
    t.text      "script",     :null => false
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.boolean   "correct"
  end

  add_index "submissions", ["user_id", "problem_id"], :name => "index_submissions_on_user_id_and_problem_id"

  create_table "users", :force => true do |t|
    t.string    "email",                                 :default => "",    :null => false
    t.string    "encrypted_password",     :limit => 128, :default => "",    :null => false
    t.string    "reset_password_token"
    t.timestamp "reset_password_sent_at"
    t.timestamp "remember_created_at"
    t.integer   "sign_in_count",                         :default => 0
    t.timestamp "current_sign_in_at"
    t.timestamp "last_sign_in_at"
    t.string    "current_sign_in_ip"
    t.string    "last_sign_in_ip"
    t.string    "confirmation_token"
    t.timestamp "confirmed_at"
    t.timestamp "confirmation_sent_at"
    t.string    "name"
    t.integer   "score",                                 :default => 0
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.boolean   "admin",                                 :default => false
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["name"], :name => "index_users_on_name"
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["score"], :name => "index_users_on_score"

end
