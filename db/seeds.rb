# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Teacher.create(name: 'Albus Dumbledore',
               email: 'dumbledore@twg.info',
               subjects: 'Headmaster',
               bio: 'Widely considered the greatest wizard of his time, Prof. Dumbledore
                    has been the Headmaster of our school for nearly 40 years.')

Teacher.create(name: 'Minerva McGonagall',
               email: 'mcgonagall@twg.info',
               subjects: 'Transformation',
               bio: 'Stern but fair, Prof. McGonagall is just the right witch to instill respect
                    for magic into our first-grade students.')

Student.create(name: 'Harry Potter',
               age: 11,
               grade: 2,
               about: '<p>Harry always seems to find trouble.</p>---MORE---<p>Or perhaps <b>trouble finds him</b>.</p>')

Student.create(name: 'Hermione Granger',
               age: 10,
               grade: 2,
               about: '<p>Hermione knows <em>everything</em>.</p>---MORE---<p>Because she has read every book.</p>')

Admin.create(email: 'admin@waldorf.info', password: 'tartuwaldorf', password_confirmation: 'tartuwaldorf')