require 'faker'

City.destroy_all
Appointment.destroy_all
Patient.destroy_all
Doctor.destroy_all
Specialty.destroy_all

specialties = %w[generaliste chirurgien anesthesiste cardiologue dermatologue gynecologue]
cities = %w[Marseille Paris Bordeaux Montpellier Lyon]
specialties.each do |spec|
  Specialty.create(name: spec)
end
cities.each do |city|
  City.create(nom: city)
  zipcode = ""
  case city
  when "Marseille";zipcode = 13700
  when "Paris";zipcode = 75000 
  when "Lyon";zipcode = 69000
  when "Bordeaux";zipcode = 33000  
  when "Montpellier";zipcode = 34000
    
  end
  Doctor.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name,zip_code: zipcode, specialty: Specialty.all.sample, city: City.all.sample)
  Patient.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, city: City.all.sample)

  20.times do 
    Appointment.create(date: Faker::Time.forward(days: 60), doctor: Doctor.all.sample, patient: Patient.all.sample, city: City.all.sample)
  end
end