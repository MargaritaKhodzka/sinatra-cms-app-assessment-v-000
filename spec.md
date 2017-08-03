# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
- [x] Use ActiveRecord for storing information in a database - used gem, activerecord, and sinatra-activerecord gems to access database
- [x] Include more than one model class (list of model class names e.g. User, Post, Category) - User, Client, Course
- [x] Include at least one has_many relationship (x has_many y e.g. User has_many Posts) - client has_many courses, user has_many clients
- [x] Include user accounts - user can sign up, log in, and log out
- [x] Ensure that users can't modify content created by other users - have logged_in? helper method
- [x] Include user input validations - have current_user helper method
- [ ] Display validation failures to user with error message (example form URL e.g. /posts/new)
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message
