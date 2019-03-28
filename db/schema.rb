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

ActiveRecord::Schema.define(version: 2019_03_28_115451) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "zip_exceptions", force: :cascade do |t|
    t.integer "orig_start"
    t.integer "orig_end"
    t.integer "dest_start"
    t.integer "dest_end"
    t.integer "mail_type"
    t.integer "filler"
    t.index ["dest_end"], name: "index_zip_exceptions_on_dest_end"
    t.index ["dest_start"], name: "index_zip_exceptions_on_dest_start"
    t.index ["orig_end"], name: "index_zip_exceptions_on_orig_end"
    t.index ["orig_start"], name: "index_zip_exceptions_on_orig_start"
  end

end
