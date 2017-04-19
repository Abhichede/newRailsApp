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

ActiveRecord::Schema.define(version: 20170418081116) do

  create_table "booking_details.js", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "customer_name"
    t.string   "customer_address"
    t.string   "customer_contact"
    t.string   "customer_pan"
    t.string   "customer_adhar"
    t.integer  "site_id"
    t.integer  "flat_id"
    t.string   "booking_charges"
    t.string   "vat"
    t.string   "service_tax"
    t.boolean  "loan_possible"
    t.string   "agreement_cost"
    t.string   "registration_fees"
    t.string   "final_sale_deed_fees"
    t.string   "stamp_duty"
    t.string   "other_charges"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "paid_amount"
  end

  create_table "flats", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "area"
    t.string   "floor"
    t.string   "flat_cost"
    t.string   "MSEB_charges"
    t.string   "other_charges"
    t.string   "water_charges"
    t.string   "parking_charges"
    t.string   "maintainance_charges"
    t.string   "govt_charges"
    t.integer  "site_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "flat_number"
    t.boolean  "booking_status"
    t.date     "booking_date"
  end

  create_table "sites", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.text     "address",     limit: 65535
    t.integer  "flat_count"
    t.string   "site_type"
    t.string   "unit_number"
    t.string   "area"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
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
