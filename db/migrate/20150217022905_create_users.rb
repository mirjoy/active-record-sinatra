class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
    end

    add_column :tasks, :user_id, :integer
  end
end
