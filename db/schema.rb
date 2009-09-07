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

ActiveRecord::Schema.define(:version => 20090907100024) do

  create_table "invoice_trails", :force => true do |t|
    t.date     "admission_date"
    t.string   "external_code"
    t.string   "last_name"
    t.string   "first_name"
    t.decimal  "gross_amount",   :precision => 3, :scale => 2, :default => 0.0
    t.decimal  "payed_amount",   :precision => 3, :scale => 2, :default => 0.0
    t.decimal  "discount",       :precision => 3, :scale => 2, :default => 0.0
    t.boolean  "payed"
    t.date     "payment_date"
    t.integer  "invoice_number"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
