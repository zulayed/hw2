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
# - Note rubric explanation for appropriate use of external resources.

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
# - You are welcome to use external resources for help with the assignment (including
#   colleagues, AI, internet search, etc). However, the solution you submit must
#   utilize the skills and strategies covered in class. Alternate solutions which
#   do not demonstrate an understanding of the approaches used in class will receive
#   significant deductions. Any concern should be raised with faculty prior to the due date.

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
Movie.destroy_all
Studio.destroy_all
Actor.destroy_all
Character.destroy_all

# Generate models and tables, according to the domain model.
# TODO!
# =============================================================================================================
#GENERATED MODELS & TABLES BY DIRECTLY TYPING BELOW COMMANDS INTO TERMINAL: 
#   rails generate model Movie title:string year_released:integer MPAA_rating:string studio_id:integer
#   rails generate model Studio name:string
#   rails generate model Actor actor_name:string
#   rails generate model Character character_name:string movie_id:integer actor_id:integer
   system("rails db:migrate")
# =============================================================================================================
#(SIDE NOTE TO THE PROFESSOR): 
#AS PART OF THIS ASSIGNMENT, PUTTING THE "GENERATE" STEP AFTER THE "DESTROY" STEP WAS EXTREMELY CONFUSING. 
#CUZ UNLIKE SQL WITH "IF EXISTS", IN RUBY YOU CANT DESTROY DATA FROM A MODEL BEFORE THE MODEL IS ACTUALLY CREATED.
#I SUGGEST SWITCHING THE ORDER OF THESE TWO "TODO's" FOR FUTURE CLASSES (UNLESS IM WRONG & MISUNDERSTOOD SOMETHING!)
# =============================================================================================================


# Insert data into the database that reflects the sample data shown above.
# Do not use hard-coded foreign key IDs.
# TODO!

#I'm going to use "".create" instead of hashvariable = model.new >> assign values to variablehash >> variablehash.save (IMO .create is simpler!)

#Insert rows in the studios table:
Studio.create(name: "Warner Bros.")
Studio.create(name: "Paramount")
Studio.create(name: "Universal")
Studio.create(name: "Disney")
Studio.create(name: "Columbia")

#Insert rows in the actors table:
Actor.create(actor_name: "Christian Bale")
Actor.create(actor_name: "Michael Caine")
Actor.create(actor_name: "Liam Neeson")
Actor.create(actor_name: "Katie Holmes")
Actor.create(actor_name: "Gary Oldman")
Actor.create(actor_name: "Heath Ledger")
Actor.create(actor_name: "Aaron Eckhart")
Actor.create(actor_name: "Maggie Gyllenhaal")
Actor.create(actor_name: "Tom Hardy")
Actor.create(actor_name: "Joseph Gordon-Levitt")
Actor.create(actor_name: "Anne Hathaway")

#Insert rows in the movies table:
studio = Studio.find_by(name:"Warner Bros.") #Not hard-coding the foreign key!!
Movie.create(title: "Batman Begins", year_released: 2005, MPAA_rating: "PG-13", studio_id: studio.id)
Movie.create(title: "The Dark Knight", year_released: 2008, MPAA_rating: "PG-13", studio_id: studio.id)
Movie.create(title: "The Dark Knight Rises", year_released: 2012, MPAA_rating: "PG-13", studio_id: studio.id)

#Insert rows in the characters table:

#Begins:
movie = Movie.find_by(title: "Batman Begins")
Character.create(character_name: "Bruce Wayne", actor_id: Actor.find_by(actor_name: "Christian Bale").id, movie_id: movie.id)
Character.create(character_name: "Alfred", actor_id: Actor.find_by(actor_name: "Michael Caine").id, movie_id: movie.id)
Character.create(character_name: "Ra's Al Ghul", actor_id: Actor.find_by(actor_name: "Liam Neeson").id, movie_id: movie.id)
Character.create(character_name: "Rachel Dawes", actor_id: Actor.find_by(actor_name: "Katie Holmes").id, movie_id: movie.id)
Character.create(character_name: "Commissioner Gordon", actor_id: Actor.find_by(actor_name: "Gary Oldman").id, movie_id: movie.id)

#Dark Knight:
movie = Movie.find_by(title: "The Dark Knight")
Character.create(character_name: "Bruce Wayne", actor_id: Actor.find_by(actor_name: "Christian Bale").id, movie_id: movie.id)
Character.create(character_name: "Alfred", actor_id: Actor.find_by(actor_name: "Michael Caine").id, movie_id: movie.id)
Character.create(character_name: "Commissioner Gordon", actor_id: Actor.find_by(actor_name: "Gary Oldman").id, movie_id: movie.id)
Character.create(character_name: "Joker", actor_id: Actor.find_by(actor_name: "Heath Ledger").id, movie_id: movie.id)
Character.create(character_name: "Harvey Dent", actor_id: Actor.find_by(actor_name: "Aaron Eckhart").id, movie_id: movie.id)
Character.create(character_name: "Rachel Dawes", actor_id: Actor.find_by(actor_name: "Maggie Gyllenhaal").id, movie_id: movie.id)

#Rises:
movie = Movie.find_by(title: "The Dark Knight Rises")
Character.create(character_name: "Bruce Wayne", actor_id: Actor.find_by(actor_name: "Christian Bale").id, movie_id: movie.id)
Character.create(character_name: "Alfred", actor_id: Actor.find_by(actor_name: "Michael Caine").id, movie_id: movie.id)
Character.create(character_name: "Commissioner Gordon", actor_id: Actor.find_by(actor_name: "Gary Oldman").id, movie_id: movie.id)
Character.create(character_name: "Bane", actor_id: Actor.find_by(actor_name: "Tom Hardy").id, movie_id: movie.id)
Character.create(character_name: "John Blake", actor_id: Actor.find_by(actor_name: "Joseph Gordon-Levitt").id, movie_id: movie.id)
Character.create(character_name: "Selina Kyle", actor_id: Actor.find_by(actor_name: "Anne Hathaway").id, movie_id: movie.id)


# Prints a header for the movies output
puts ""
puts "Movies"
puts "======"
puts ""

# Query the movies data and loop through the results to display the movies output.
# TODO!
for movie in Movie.all 
    studio = Studio.find(movie.studio_id) 
    puts "#{movie.title.ljust(25)} #{movie.year_released} #{movie.MPAA_rating.rjust(10)} #{studio.name.rjust(15)}" 
    #added the .ljust and .rjust later for spacing the output more nicely! :p
end
puts ""

# Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"
puts ""

# Query the cast data and loop through the results to display the cast output for each movie.
# TODO!
for cast in Character.all
    actor = Actor.find(cast.actor_id)
    movie = Movie.find(cast.movie_id)
    puts "#{movie.title.ljust(25)} #{actor.actor_name.ljust(25)} #{cast.character_name}"
end
puts ""