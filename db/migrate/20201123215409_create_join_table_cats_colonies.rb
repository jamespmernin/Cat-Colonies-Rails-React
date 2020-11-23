class CreateJoinTableCatsColonies < ActiveRecord::Migration[6.0]
  def change
    create_join_table :cats, :colonies do |t|
      # t.index [:cat_id, :colony_id]
      # t.index [:colony_id, :cat_id]
    end
  end
end
