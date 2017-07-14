class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
    	t.string   "title"
    	t.text     "description"
    	t.text     "details"
    	t.decimal  "price"
    	t.string   "link"
    	t.boolean  "active",	default: true
	
    	t.datetime "created_at",	null: false
    	t.datetime "updated_at",	null: false
    	t.timestamps
    end
  end
end
