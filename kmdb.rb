# In this assignment, you'll be using the domain model from hw1 (found in the hw1-solution.sql file)
# to create the database structure for "KMDB" (the Kellogg Movie Database).
# The end product will be a report that prints the movies and the top-billed
# cast for each movie in the database.

# To run this file, run the following command at your terminal prompt:
# `rails runner kmdb.rb`

# Requirements/assumptions
#
# - There will only be three movies in the database – the three films
#   that make up Christopher Nolan's Batman trilogy.
# - Movie data includes the movie title, year released, MPAA rating,
#   and studio.
# - There are many studios, and each studio produces many movies, but
#   a movie belongs to a single studio.
# - An actor can be in multiple movies.
# - Everything you need to do in this assignment is marked with TODO!

# Rubric
# 
# There are three deliverables for this assignment, all delivered within
# this repository and submitted via GitHub and Canvas:
# - Generate the models and migration files to match the domain model from hw1.
#   Table and columns should match the domain model. Execute the migration
#   files to create the tables in the database. (5 points)
# - Insert the "Batman" sample data using ruby code. Do not use hard-coded ids.
#   Delete any existing data beforehand so that each run of this script does not
#   create duplicate data. (5 points)
# - Query the data and loop through the results to display output similar to the
#   sample "report" below. (10 points)

# Submission
# 
# - "Use this template" to create a brand-new "hw2" repository in your
#   personal GitHub account, e.g. https://github.com/<USERNAME>/hw2
# - Do the assignment, committing and syncing often
# - When done, commit and sync a final time before submitting the GitHub
#   URL for the finished "hw2" repository as the "Website URL" for the 
#   Homework 2 assignment in Canvas

# Successful sample output is as shown:

# Movies
# ======

# Batman Begins          2005           PG-13  Warner Bros.
# The Dark Knight        2008           PG-13  Warner Bros.
# The Dark Knight Rises  2012           PG-13  Warner Bros.

# Top Cast
# ========

# Batman Begins          Christian Bale        Bruce Wayne
# Batman Begins          Michael Caine         Alfred
# Batman Begins          Liam Neeson           Ra's Al Ghul
# Batman Begins          Katie Holmes          Rachel Dawes
# Batman Begins          Gary Oldman           Commissioner Gordon
# The Dark Knight        Christian Bale        Bruce Wayne
# The Dark Knight        Heath Ledger          Joker
# The Dark Knight        Aaron Eckhart         Harvey Dent
# The Dark Knight        Michael Caine         Alfred
# The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
# The Dark Knight Rises  Christian Bale        Bruce Wayne
# The Dark Knight Rises  Gary Oldman           Commissioner Gordon
# The Dark Knight Rises  Tom Hardy             Bane
# The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
# The Dark Knight Rises  Anne Hathaway         Selina Kyle

# Delete existing data, so you'll start fresh each time this script is run.
# Use `Model.destroy_all` code.
# TODO!

Studio.destroy_all
Movie.destroy_all
Actor.destroy_all
Role.destroy_all

# Generate models and tables, according to the domain model.
# TODO!

#DONE

# Insert data into the database that reflects the sample data shown above.
# Do not use hard-coded foreign key IDs.
# TODO!

puts "There are #{Studio.all.count} studios"
new_studio = Studio.new 
new_studio["name"] = "Warner Bros."
new_studio.save

warner = Studio.find_by({ "name" => "Warner Bros." })
new_movie = Movie.new
new_movie["title"] = "Batman Begins"
new_movie["year released"] = "2005"
new_movie["rated"] = "PG-13"
new_movie["studio_id"] = warner ["id"]
new_movie.save

new_movie2 = Movie.new
new_movie2["title"] = "The Dark Knight"
new_movie2["year released"] = "2008"
new_movie2["rated"] = "PG-13"
new_movie2["studio_id"] = warner ["id"]
new_movie2.save

new_movie3 = Movie.new
new_movie3["title"] = "The Dark Knight Rises"
new_movie3["year released"] = "2012"
new_movie3["rated"] = "PG-13"
new_movie3["studio_id"] = warner ["id"]
new_movie3.save

puts "There are #{Movie.all.count} movies"


new_actor = Actor.new 
new_actor["name"] = "Christian Bale"
new_actor.save 

new_actor2 = Actor.new 
new_actor2["name"] = "Michael Caine"
new_actor2.save

new_actor3 = Actor.new 
new_actor3["name"] = "Liam Neeson"
new_actor3.save

new_actor4 = Actor.new 
new_actor4["name"] = "Katie Holmes"
new_actor4.save

new_actor5 = Actor.new 
new_actor5["name"] = "Gary Oldman"
new_actor5.save

new_actor6 = Actor.new 
new_actor6["name"] = "Heath Ledger"
new_actor6.save

new_actor7 = Actor.new 
new_actor7["name"] = "Aaron Eckhart"
new_actor7.save

new_actor8 = Actor.new 
new_actor8["name"] = "Maggie Gyllenhaal"
new_actor8.save

new_actor9 = Actor.new 
new_actor9["name"] = "Tom Hardy"
new_actor9.save

new_actor10 = Actor.new 
new_actor10["name"] = "Joseph Gordon-Levitt"
new_actor10.save

new_actor11 = Actor.new 
new_actor11["name"] = "Anne Hathaway"
new_actor11.save

puts "There are #{Actor.all.count} actors"

batman = Movie.find_by({ "title" => "Batman Begins" })
christian = Actor.find_by({ "name" => "Christian Bale" })
role = Role.new
role["movie_id"] = batman ["id"]
role["actor_id"] = christian ["id"]
role["character_name"] = "Bruce Wayne"
role.save

batman = Movie.find_by({ "title" => "Batman Begins" })
michael = Actor.find_by({ "name" => "Michael Caine" })
role = Role.new
role["movie_id"] = batman ["id"]
role["actor_id"] = michael ["id"]
role["character_name"] = "Alfred"
role.save

batman = Movie.find_by({ "title" => "Batman Begins" })
liam = Actor.find_by({ "name" => "Liam Neeson" })
role = Role.new
role["movie_id"] = batman ["id"]
role["actor_id"] = liam ["id"]
role["character_name"] = "Ra's Al Ghul"
role.save

batman = Movie.find_by({ "title" => "Batman Begins" })
katie = Actor.find_by({ "name" => "Katie Holmes" })
role = Role.new
role["movie_id"] = batman ["id"]
role["actor_id"] = katie ["id"]
role["character_name"] = "Rachel Dawes"
role.save

batman = Movie.find_by({ "title" => "Batman Begins" })
gary = Actor.find_by({ "name" => "Gary Oldman" })
role = Role.new
role["movie_id"] = batman ["id"]
role["actor_id"] = gary ["id"]
role["character_name"] = "Commissioner Gordon"
role.save

darkknight = Movie.find_by({ "title" => "The Dark Knight" })
christian = Actor.find_by({ "name" => "Christian Bale" })
role = Role.new
role["movie_id"] = darkknight ["id"]
role["actor_id"] = christian ["id"]
role["character_name"] = "Bruce Wayne"
role.save

darkknight = Movie.find_by({ "title" => "The Dark Knight" })
heath = Actor.find_by({ "name" => "Heath Ledger" })
role = Role.new
role["movie_id"] = darkknight ["id"]
role["actor_id"] = heath ["id"]
role["character_name"] = "Joker"
role.save

darkknight = Movie.find_by({ "title" => "The Dark Knight" })
aaron = Actor.find_by({ "name" => "Aaron Eckhart" })
role = Role.new
role["movie_id"] = darkknight ["id"]
role["actor_id"] = aaron ["id"]
role["character_name"] = "Harvey Dent"
role.save

darkknight = Movie.find_by({ "title" => "The Dark Knight" })
michael = Actor.find_by({ "name" => "Michael Caine" })
role = Role.new
role["movie_id"] = darkknight ["id"]
role["actor_id"] = michael ["id"]
role["character_name"] = "Alfred"
role.save

darkknight = Movie.find_by({ "title" => "The Dark Knight" })
maggie = Actor.find_by({ "name" => "Maggie Gyllenhaal" })
role = Role.new
role["movie_id"] = darkknight ["id"]
role["actor_id"] = maggie ["id"]
role["character_name"] = "Rachel Dawes"
role.save

darkknightrises = Movie.find_by({ "title" => "The Dark Knight Rises" })
christian = Actor.find_by({ "name" => "Christian Bale" })
role = Role.new
role["movie_id"] = darkknightrises ["id"]
role["actor_id"] = christian ["id"]
role["character_name"] = "Bruce Wayne"
role.save

darkknightrises = Movie.find_by({ "title" => "The Dark Knight Rises" })
gary = Actor.find_by({ "name" => "Gary Oldman" })
role = Role.new
role["movie_id"] = darkknightrises ["id"]
role["actor_id"] = gary ["id"]
role["character_name"] = "Commissioner Gordon"
role.save

darkknightrises = Movie.find_by({ "title" => "The Dark Knight Rises" })
tom = Actor.find_by({ "name" => "Tom Hardy" })
role = Role.new
role["movie_id"] = darkknightrises ["id"]
role["actor_id"] = tom ["id"]
role["character_name"] = "Bane"
role.save

darkknightrises = Movie.find_by({ "title" => "The Dark Knight Rises" })
joseph = Actor.find_by({ "name" => "Joseph Gordon-Levitt" })
role = Role.new
role["movie_id"] = darkknightrises ["id"]
role["actor_id"] = joseph ["id"]
role["character_name"] = "John Blake"
role.save

darkknightrises = Movie.find_by({ "title" => "The Dark Knight Rises" })
anne = Actor.find_by({ "name" => "Anne Hathaway" })
role = Role.new
role["movie_id"] = darkknightrises ["id"]
role["actor_id"] = anne ["id"]
role["character_name"] = "Selina Kyle"
role.save

puts "There are #{Role.all.count} roles"


# Prints a header for the movies output
puts "Movies"
puts "======"
puts ""

# Query the movies data and loop through the results to display the movies output.
# TODO!

# loop through movies
for title in Movie
   puts "#{title["title"]}"
end

# Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"
puts ""

# Query the cast data and loop through the results to display the cast output for each movie.
# TODO!
