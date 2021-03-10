class CreateAstronauts < ActiveRecord::Migration[6.1]
  def change
    create_table :astronauts do |t|
      t.string :name
      t.string :surname
      t.string :gender
      t.integer :age
      t.integer :number_of_space_visits
      t.timestamps
    end
  end
end
