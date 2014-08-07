class CreateVacancies < ActiveRecord::Migration
  def change
    Cms::ContentType.create!(:name => "Vacancy", :group_name => "Vacancy")
    create_content_table :vacancies, :prefix=>false do |t|
      t.string :name
      t.text :full_description, :size => (64.kilobytes + 1)
      
      

      t.timestamps
    end
  end
end
