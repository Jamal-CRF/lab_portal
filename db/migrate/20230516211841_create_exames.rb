class CreateExames < ActiveRecord::Migration[7.0]
  def change
    create_table :exames do |t|
      t.integer :doctor_id
      t.integer :patient_id
      t.text :description

      t.timestamps
    end
  end
end
