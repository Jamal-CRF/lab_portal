class CreateUserHospitals < ActiveRecord::Migration[7.0]
  def change
    create_table :user_hospitals do |t|
      t.references :user, null: false, foreign_key: true
      t.references :hospital, null: false, foreign_key: true
      t.integer :role

      t.timestamps
    end
  end
end
