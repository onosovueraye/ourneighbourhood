# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts 'clearing users and reports databases'

Report.destroy_all
User.destroy_all

puts 'Creating 4 test users.'
user1 = User.create!(name: 'Bruce Wayne', email: 'bruce@wayne.com', password: '123456', address: "101 Wayne Street", neighbourhood: "Gotham")
user2 = User.create!(name: 'Stacey', email: 'user1@test.com', password: '123456', address: "5 Pearson Street", neighbourhood: "Hackney")
user3 = User.create!(name: 'Aasmund Gravem', email: 'user2@test.com', password: '123456', address: "7 Pearson Street", neighbourhood: "Hackney")
user4 = User.create!(name: 'Sarah Connor', email: 'user3@test.com', password: '123456', address: "2 Terminator Street", neighbourhood: "Brooklyn")

puts 'Creating 8 reports in the neighbourhood'
# photoReport1 = URI.open('')
# report1 = Report.create!(title: '', description: '', locaction: '', category: '', votes: '', status: '', user_id: '')
# report1.photo.attach(io: photo_report_1, filename: '', content_type: 'image/jpg')
# report1.save

# photoReport2 = URI.open('')
# report2 = Report.create!(title: '', description: '', locaction: '', category: '', votes: '', status: '', user_id: '')
# report2.photo.attach(io: photo_report_2, filename: '', content_type: 'image/jpg')
# report2.save

# photoReport3 = URI.open('')
# report3 = Report.create!(title: '', description: '', locaction: '', category: '', votes: '', status: '', user_id: '')
# report3.photo.attach(io: photo_report_3, filename: '', content_type: 'image/jpg')
# report3.save

# photoReport4 = URI.open('')
# report4 = Report.create!(title: '', description: '', locaction: '', category: '', votes: '', status: '', user_id: '')
# report4.photo.attach(io: photo_report_4, filename: '', content_type: 'image/jpg')
# report4.save

# photoReport5 = URI.open('')
# report5 = Report.create!(title: '', description: '', locaction: '', category: '', votes: '', status: '', user_id: '')
# report5.photo.attach(io: photo_report_5, filename: '', content_type: 'image/jpg')
# report5.save

# photoReport6 = URI.open('')
# report6 = Report.create!(title: '', description: '', locaction: '', category: '', votes: '', status: '', user_id: '')
# report6.photo.attach(io: photo_report_6, filename: '', content_type: 'image/jpg')
# report6.save

# photoReport7 = URI.open('')
# report7 = Report.create!(title: '', description: '', locaction: '', category: '', votes: '', status: '', user_id: '')
# report7.photo.attach(io: photo_report_7, filename: '', content_type: 'image/jpg')
# report7.save

# photoReport8 = URI.open('')
# report8 = Report.create!(title: '', description: '', locaction: '', category: '', votes: '', status: '', user_id: '')
# report8.photo.attach(io: photo_report_8, filename: '', content_type: 'image/jpg')
# report8.save

photo_report1 = URI.open('https://images.unsplash.com/photo-1560782205-4dd83ceb0270?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1887&q=80')
report1 = Report.create!(title: 'Pothole on Maple St', description: 'There is a huge pothole on Maple Street near the park, which is dangerous for pedestrians.', location: 'Hackney', category: 'Repair', votes: '10', status: 'Unclaimed', user_id: user2.id)
report1.photos.attach(io: photo_report1, filename: 'pothole.jpg', content_type: 'image/jpg')
report1.save

photo_report2 = URI.open('https://citylimits.org/wp-content/uploads/2019/08/IMG_4026-e1565128808437-771x578.jpg')
report2 = Report.create!(title: 'Litter in Central Park', description: 'Central Park is filled with litter. It would be great if it could be cleaned up.', location: 'Central Park', category: 'Repair', votes: '15', status: 'Unclaimed', user_id: user2.id)
report2.photos.attach(io: photo_report2, filename: 'litter_central_park.jpg', content_type: 'image/jpg')
report2.save

photo_report3 = URI.open('https://images.squarespace-cdn.com/content/v1/58ac1caa1b10e326aa206413/1495036866701-PO62WWTEGERO8NC6PSEW/OFF+THE+WALL+-+A+BLANK+CANVAS+%231.JPG?format=500w')
report3 = Report.create!(title: 'Mural on Elm St', description: 'There is an ugly wall of Elm Street. It would be better replaced with a mural.', location: 'Elm Street', category: 'Improvement', votes: '12', status: 'Unclaimed', user_id: user1.id)
report3.photos.attach(io: photo_report3, filename: 'graffiti_elm_st.jpg', content_type: 'image/jpg')
report3.save

photo_report4 = URI.open('https://www.pumpcourtchambers.com/wp-content/uploads/2020/04/200414-Empty-Highstreet.jpeg')
report4 = Report.create!(title: 'Flowerbed at Town Hall', description: 'The area around the town hall could be beautified with a flowerbed.', location: 'Town Hall', category: 'Improvement', votes: '18', status: 'Unclaimed', user_id: user3.id)
report4.photos.attach(io: photo_report4, filename: 'town_hall_area.jpg', content_type: 'image/jpg')
report4.save

photo_report5 = URI.open('https://img.freepik.com/premium-photo/vandalism-broken-bench-park_657590-6261.jpg?w=2000')
report5 = Report.create!(title: 'Broken Bench in Park', description: 'The bench near the lake in the park is broken and needs repair.', location: 'Park', category: 'Repair', votes: '8', status: 'Unclaimed', user_id: user3.id)
report5.photos.attach(io: photo_report5, filename: 'broken_bench_park.jpg', content_type: 'image/jpg')
report5.save

photo_report6 = URI.open('https://i2-prod.bristolpost.co.uk/news/bristol-news/article725591.ece/ALTERNATES/s615b/crossingJPG.jpg')
report6 = Report.create!(title: 'Faded Crosswalk Lines', description: 'The crosswalk lines at the junction of Pine and 1st are faded. Repainting is needed.', location: 'Pine and 1st', category: 'Repair', votes: '12', status: 'Unclaimed', user_id: user1.id)
report6.photos.attach(io: photo_report6, filename: 'faded_crosswalk.jpg', content_type: 'image/jpg')
report6.save

photo_report7 = URI.open('https://media.newyorker.com/photos/590954782179605b11ad3e88/master/w_2560%2Cc_limit/Slideshow5_25.JPG')
report7 = Report.create!(title: 'Poor Lighting on Oak St', description: 'Oak Street has poor lighting which makes it unsafe at night. More streetlights could improve the situation.', location: 'Oak Street', category: 'Repair', votes: '10', status: 'Unclaimed', user_id: user4.id)
report7.photos.attach(io: photo_report7, filename: 'poor_lighting_oak_st.jpg', content_type: 'image/jpg')
report7.save

photo_report8 = URI.open('https://www.royalparks.org.uk/parks/the-regents-park/things-to-see-and-do/primrose-hill/_gallery/Park-bench-on-Primrose-Hill.jpg/w_768.jpg')
report8 = Report.create!(title: 'Community garden in Park', description: 'Empty bit in the park would be perfect for a little community garden.', location: 'The Park', category: 'Improvement', votes: '44', status: 'Unclaimed', user_id: user3.id)
report8.photos.attach(io: photo_report8, filename: 'overgrown_bushes_park.jpg', content_type: 'image/jpg')
report8.save

puts 'Seed done'
