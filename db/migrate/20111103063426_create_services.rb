class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :provider
      t.string :uid
      t.string :token
      t.string :secret
      t.integer :user_id

      t.timestamps
    end
  end
end
