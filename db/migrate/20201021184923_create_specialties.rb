class CreateSpecialties < ActiveRecord::Migration[5.2]
  def change
    
    create_table :specialties do |t|
      t.string :name
      t.timestamps
    end

    remove_column :doctors, :specialty, :string
    add_reference :doctors, :city, foreign_key: true
    add_reference :doctors, :specialty, foreign_key: true
    add_reference :patients, :city, foreign_key: true
    add_reference :appointments, :city, foreign_key:true

  end
end
