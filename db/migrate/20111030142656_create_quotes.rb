class CreateQuotes < ActiveRecord::Migration
  def change
    create_table :quotes do |t|
      t.text :body
      t.string :reference
      t.text :remark

      t.timestamps
    end
  end
end
