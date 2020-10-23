class CreateJoinTableDoctorsSpecialties < ActiveRecord::Migration[5.2]
  def change
    create_table :join_table_doctors_specialties do |t|
      t.belongs_to :doctor
      t.belongs_to :specialty
      t.timestamps
    end
    remove_reference :doctors, :join_table_doctors_specialty, foreign_key: true
    remove_reference :specialties, :join_table_doctors_specialty, foreign_key: true
  end
end