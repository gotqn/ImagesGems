class CreateDemoGems < ActiveRecord::Migration
  def change
    create_table :demo_gems do |t|
      t.string :name
      t.string :description
      t.string :image
      t.string :github
      t.string :rubygems
      t.text :code

      t.timestamps
    end
  end
end
