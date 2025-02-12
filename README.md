# ENTR-451 Assignment #2 

COMPLETED ASSIGNMENT | NOTE: Migration doesnt seem to work from the kmdb.rb script: 
`rails runner kmdb.rb` OR system("rails runner kmdb.rb") both return errors.
Therefore please run "rails db:migrate" in the terminal once before running the "kmdb.rb" file.


###
Now that we know how to connect our ruby code (in a Rails app) to our SQL database, let's rewrite the previous assignment in ruby.  You'll be using the domain model from _[hw1](hw1-solution.sql)_ to create the database structure for "KMDB" (the Kellogg Movie Database). The end product will be a report that prints the movies and the top-billed cast for each movie in the database.

### Getting Started

- Use this template to create a new GitHub repository (click *Use this template* at the top of this page); be sure that the new repository in your account is named `hw2`
- Open the new repository (the one in your GitHub account – it should be called `_Your GitHub Username_/hw2`) in Gitpod. 
- Complete the assignment per the detailed instructions found in the comments of _[kmdb.rb](kmdb.rb)_, executing the script by using the `rails runner kmdb.rb` command.
- Commit and sync often! When complete, ensure that your most up-to-date, finished work lives in your GitHub repository, then, submit the URL to your GitHub repository page – i.e. `https://github.com/_Your GitHub Username_/hw2`
