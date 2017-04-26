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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170426142858) do

  create_table "booking_details", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "customer_name"
    t.string   "customer_address"
    t.string   "customer_contact"
    t.string   "customer_pan"
    t.string   "customer_adhar"
    t.integer  "site_id"
    t.integer  "flat_id"
    t.string   "vat"
    t.string   "service_tax"
    t.boolean  "loan_possible"
    t.string   "agreement_cost"
    t.string   "registration_fees"
    t.string   "lbt"
    t.string   "stamp_duty"
    t.string   "other_charges"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "paid_amount"
    t.string   "MSEB_charges"
    t.string   "water_charges"
    t.string   "parking_charges"
    t.string   "maintenance_charges"
    t.string   "legal_charges"
    t.string   "name_of_bank"
    t.string   "branch_of_bank"
    t.string   "sanctioned_amount"
    t.string   "employee_name"
  end

  create_table "flats", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "area"
    t.string   "floor"
    t.string   "flat_cost"
    t.integer  "site_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "flat_number"
    t.boolean  "booking_status"
    t.date     "booking_date"
    t.string   "govt_rate"
    t.string   "govt_value"
    t.string   "flat_type"
    t.string   "wing"
    t.string   "amenities"
    t.string   "flat_rate"
  end

  create_table "payment_details", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "payable_amount"
    t.string   "payment_type"
    t.string   "payment_desc"
    t.integer  "booking_detail_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "sites", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.text     "address",             limit: 65535
    t.integer  "no_of_units"
    t.string   "type_of_structures"
    t.string   "unit_number"
    t.string   "area_of_plot"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "project_approved_by"
    t.string   "photo_path"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
