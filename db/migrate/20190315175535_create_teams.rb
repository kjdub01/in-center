class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.string :teamname
      t.string :contactname
      t.string :contactnumber
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :zipcode

      t.timestamps 
    end
  end
end
