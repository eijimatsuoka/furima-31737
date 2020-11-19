class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      
      t.references :user, null:false, foreign_key: ture
      t.string :name, 

      t.timestamps
    end
  end
end
