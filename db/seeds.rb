# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

#Data for Specialties

specialty =["Dermatology","Diagnostic radiology","Family medicine","Internal medicine","Neurology","Obstetrics and gynecology","Ophthalmology","Pediatrics","Psychiatry","Radiation oncology","Urology"]

specialty.each do |spec|
  Specialty.create(name: spec)
end

specialties = Specialty.all

#Data for Cities

100.times do |z|
  z = City.create(name: Faker::Address.city)
end

cities = City.all


#Data for Doctors
100.times do |a|
  a = Doctor.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, zip_code: Faker::Address.zip_code, city: cities.sample)
end

doctors = Doctor.all

#Data for Patients
100.times do |b|
  b = Patient.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, city: cities.sample)
end

patients = Patient.all

#Data for Appointments
100.times do |c|
  c = Appointment.create(doctor: doctors.sample, patient: patients.sample, city: cities.sample, date: Faker::Time.forward(days: 23, period: :day))
end

#Data for Doctor_Specialty

doctors.each do |doctor|
  DoctorSpecialty.create(doctor: doctor, specialty: specialties.sample )
end