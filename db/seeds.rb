require 'faker'

City.destroy_all
Appointment.destroy_all
Patient.destroy_all
Doctor.destroy_all
Specialty.destroy_all
JoinTableDoctorsSpecialty.destroy_all

specialties = %w[generaliste chirurgien anesthesiste cardiologue dermatologue gynecologue]
cities = %w[Marseille Paris Bordeaux Montpellier Lyon]

specialties.each do |spec|
  Specialty.create(name: spec)
end
puts
puts "Specialties Table"
tp Specialty.all

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
  Doctor.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name,zip_code: zipcode, city: City.all.sample)
  Patient.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, city: City.all.sample)
end
puts
puts "Cities Table"
tp City.all

puts
puts "Patients Table"
tp Patient.all

puts
puts "Doctors Table"
tp Doctor.all
  

  20.times do 
    Appointment.create(date: Faker::Time.forward(days: 60), doctor: Doctor.all.sample, patient: Patient.all.sample, city: City.all.sample)
  end

  puts
  puts "Appointments Table"
  tp Appointment.all
  
  Doctor.all.each do |d|
    JoinTableDoctorsSpecialty.create(doctor: d, specialty: Specialty.all.sample)
  end

  Specialty.all.each do |s|
    JoinTableDoctorsSpecialty.create(doctor: Doctor.all.sample, specialty: s)
  end

  puts
  puts "JoinTableDoctorsSpecialties Table"
  tp JoinTableDoctorsSpecialty.all
  
 