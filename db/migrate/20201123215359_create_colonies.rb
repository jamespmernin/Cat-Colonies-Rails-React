class CreateColonies < ActiveRecord::Migration[6.0]
  def change
    create_table :colonies do |t|
      t.string :name
      t.string :borough

      t.timestamps
    end
  end
end
