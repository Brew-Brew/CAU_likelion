class CreateTeams < ActiveRecord::Migration[5.1]
  def change
    create_table :teams do |t|
      t.integer :number
      t.string :study_date

      t.timestamps
    end
  end
end
