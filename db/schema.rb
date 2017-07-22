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

ActiveRecord::Schema.define(version: 20170722032502) do

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
    t.string   "loan_possible"
    t.string   "agreement_cost"
    t.string   "registration_fees"
    t.string   "lbt"
    t.string   "stamp_duty"
    t.string   "other_charges"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
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
    t.string   "token_amount"
    t.string   "payment_type"
    t.string   "payment_desc"
    t.string   "final_sale_deed"
    t.string   "schedule_date"
    t.string   "schedule_desc"
    t.string   "booking_date"
    t.string   "gender",              default: "MR."
    t.string   "flat_cost",           default: "0"
    t.boolean  "is_gst",              default: false
    t.integer  "gst_rate",            default: 0
    t.string   "gst_cost",            default: "0"
  end

  create_table "contract_lists", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.boolean  "deleting_status", default: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "contract_unit"
  end

  create_table "contractors", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "contact_number"
    t.string   "address"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "total_amount"
    t.string   "paid_amount"
  end

  create_table "contractual_labours", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "date"
    t.string   "contract_name"
    t.integer  "contractor_id"
    t.string   "quantity"
    t.string   "unit"
    t.string   "rate"
    t.string   "amount"
    t.string   "created_by"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "site_id"
  end

  create_table "delayed_jobs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "priority",                 default: 0, null: false
    t.integer  "attempts",                 default: 0, null: false
    t.text     "handler",    limit: 65535,             null: false
    t.text     "last_error", limit: 65535
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree
  end

  create_table "departmental_labours", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "date"
    t.string   "type_of_work"
    t.string   "amount"
    t.string   "paid_amount"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "site_id"
  end

  create_table "flats", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "area"
    t.string   "floor"
    t.string   "flat_cost",      default: "0"
    t.integer  "site_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "flat_number"
    t.boolean  "booking_status"
    t.date     "booking_date"
    t.string   "govt_rate"
    t.string   "govt_value"
    t.string   "flat_type"
    t.string   "wing"
    t.string   "amenities"
    t.string   "flat_rate",      default: "0"
  end

  create_table "investment_monthly_interests", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "investment_id"
    t.string   "interest_rate"
    t.string   "interest"
    t.string   "paid_interest",                   default: "0"
    t.string   "paid_date",                       default: "nil"
    t.string   "paid_by",                         default: "NA"
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "month"
    t.decimal  "pending_interest", precision: 10, default: 0
  end

  create_table "investment_return_meta", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "investment_id"
    t.string   "meta_key"
    t.string   "meta"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "investment_returns", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "date"
    t.integer  "investment_id"
    t.string   "amount"
    t.string   "description",     default: "NA"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "payment_method",  default: "NA"
    t.string   "paid_by"
    t.boolean  "deleting_status", default: false
  end

  create_table "investments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "investor_id"
    t.string   "investment_date"
    t.string   "investment_amount"
    t.string   "interest_rate"
    t.string   "created_by"
    t.string   "deleting_status",        default: "0"
    t.string   "returned_amount",        default: "0"
    t.string   "last_return_date",       default: ""
    t.string   "last_month_interest",    default: ""
    t.string   "current_month_interest", default: ""
    t.string   "total_payable_amount",   default: ""
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  create_table "investors", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "address"
    t.string   "contact_number"
    t.string   "email"
    t.boolean  "deleting_status"
    t.string   "created_by"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "list_materials", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "unit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "material_lists", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "material_name"
    t.string   "material_unit"
    t.boolean  "deleting_status"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "materials", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "date"
    t.integer  "supplier_id"
    t.integer  "site_id"
    t.string   "type_of_material"
    t.string   "quantity"
    t.string   "unit"
    t.string   "challan_no"
    t.string   "truck_no"
    t.string   "time"
    t.string   "rate"
    t.string   "amount"
    t.string   "supervisor_name"
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
    t.string   "description",      default: "NA"
    t.string   "challan_item",     default: "NA"
    t.boolean  "is_rate_added",    default: false
    t.string   "rate_added_by",    default: "NA"
    t.string   "bill_no",          default: "NA"
    t.boolean  "is_gst",           default: false
    t.integer  "gst_rate",         default: 0
    t.string   "gst_cost",         default: "0"
    t.datetime "rate_added_at",    default: '2017-07-22 03:31:05'
  end

  create_table "office_expences", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "date"
    t.string   "description"
    t.string   "amount"
    t.string   "payment_to"
    t.string   "payment_method"
    t.string   "payment_desc"
    t.string   "paid_by"
    t.boolean  "deleting_status"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "outgoing_payments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "payment_for"
    t.string   "amount"
    t.string   "payment_method"
    t.string   "payment_description"
    t.string   "site_id"
    t.string   "paid_by"
    t.string   "date"
    t.boolean  "deleting_status",     default: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "payment_to",          default: "NA"
  end

  create_table "payment_details", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "payable_amount"
    t.string   "payment_type"
    t.string   "payment_desc"
    t.integer  "booking_detail_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "payment_date"
  end

  create_table "sites", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.text     "address",             limit: 65535
    t.integer  "no_of_flats"
    t.string   "type_of_structures"
    t.string   "unit_number"
    t.string   "area_of_plot"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "project_approved_by"
    t.string   "photo_path"
    t.string   "site_type"
    t.string   "no_of_wings"
    t.string   "no_of_shops"
  end

  create_table "supplier_payments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "supplier_id"
    t.integer  "material_id"
    t.integer  "site_id"
    t.string   "amount"
    t.string   "payment_method"
    t.string   "payment_desc"
    t.string   "payment_date"
    t.string   "paid_by"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "suppliers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "address"
    t.string   "email"
    t.string   "contact_number"
    t.string   "contact_person"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "deleting_status"
    t.string   "total_amount"
    t.string   "paid_amount"
  end

  create_table "type_of_structures", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.string   "user_name"
    t.string   "role"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
