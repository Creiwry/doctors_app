# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

specialty =["Dermatology","Diagnostic radiology","Family medicine","Internal medicine","Neurology","Obstetrics and gynecology","Ophthalmology","Pediatrics","Psychiatry","Radiation oncology","Urology"]



100.times do |a|
  a = Doctor.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, specialty: specialty.sample, zip_code: Faker::Address.zip_code)
end

100.times do |b|
  b = Patient.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
end

doctors = Doctor.all
patients = Patient.all

100.times do |c|
  c = Appointment.create(doctor: doctors.sample, patient: patients.sample, date: Faker::Date.in_date_period)
end