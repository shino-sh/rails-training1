class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :name
      t.text :content
      
      t.belongs_to :posts

      t.timestamps null: false
    end
  end
end
