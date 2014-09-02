class CreateFormConfigs < ActiveRecord::Migration
  def change
    create_table :form_configs do |t|
      t.string :name

      t.timestamps
    end
  end
end
