class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :phone
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :zipcode
      t.boolean :admin, default: false

      t.timestamps
    end
  end
end
