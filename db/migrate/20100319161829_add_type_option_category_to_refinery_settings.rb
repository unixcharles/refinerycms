class AddTypeOptionCategoryToRefinerySettings < ActiveRecord::Migration
  def self.up
    change_table "refinery_settings" do |t|
      t.string "form_type"
      t.string "form_options"
      t.string "form_values"
      t.string "category"
    end
  end

  def self.down
    change_table "refinery_settings" do |t|
      t.remove :form_type
      t.remove :form_options
      t.remove :form_values
      t.remove :category
    end
  end
end
