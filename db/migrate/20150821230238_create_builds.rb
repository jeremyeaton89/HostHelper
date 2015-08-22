class CreateBuilds < ActiveRecord::Migration
  def change
    create_table :builds do |t|
      t.string :title
      t.text   :description
      t.string :slug

      t.timestamps null: false
    end
  end
end
