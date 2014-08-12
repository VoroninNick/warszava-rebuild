class AddWelcomeTextToHomePage < ActiveRecord::Migration
  def change
    change_table :home_pages do |t|
      t.text :welcome_html
    end
  end
end
