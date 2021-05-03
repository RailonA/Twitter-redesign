class CreateUsers < ActiveRecord::Migration[6.1]
  def integer
    create_table :users do |t|
      t.string :username
      t.string :name

      t.timestamps
    end
  end
end
