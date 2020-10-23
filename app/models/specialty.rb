class Specialty < ApplicationRecord
  has_many :JoinTableDoctorsSpecialties
  has_many :doctors, through: :JoinTableDoctorsSpecialties
end
