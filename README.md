#### README
# CropCommand

##### CropCommand was created as a first step in building a data management system for commercial-scale indoor/controlled environment agriculture. It features secure login and offers full CRUD functionality for data entry and management of crop planting lot data.  Keeping detailed and accurate crop production data is vital to the success of intensive agriculture.  This provides a platform to easily maintain these records.

### visit [CropCommand](https://cropcommand.herokuapp.com/) on Heroku
Developed by Steven Bell, January 2015 at General Assembly, Atlanta.
##Technologies used:
#### [Ruby version 2.2.4](https://www.ruby-lang.org)
#### [Ruby on Rails version 4.2.5](http://rubyonrails.org)
#### [PostgreSQL 9.4](http://www.postgresql.org)
#### [SASS 3.4](http://sass-lang.com)
#### [Twitter Bootstrap 3.3](http://getbootstrap.com) and [Bootswatch Yeti Theme](http://bootswatch.com/yeti)
#### JavaScript
#### HTML


### Project specific gems:
- 'better_errors' - provides improved Rails error pages
- 'rails_12factor', group: :production
- 'bootstrap-generators', '~> 3.3.4' -> adds Twitter Bootstrap styling to our rails generated
- 'pry-rails'  ->causes rails console to open pry instead of irb
- 'better_errors'
- 'bcrypt', '~> 3.1.7'

####[Project based partially on this tutorial by Dr. Mike Hopper](https://github.com/drmikeh/rails_todo_app)

#### Configuration
- ensure that stylesheets imports are correctly linked for your environemnet in the application.html.erb file - they are currently set for Heroku and therefore broken on localhost
-be sure to precompile all image assets by using the following line `Rails.application.config.assets.precompile += %w(myAsset.jpg)`
in the app/config/initilizers/assets.rb.  In the same file add this line `Rails.application.config.assets.version = '1.0'`
This line is not strickly necessary when using the gem 'rails_12factor' but adding it fixed
an issue rendering an image in the nav bar.
-Make all changes to styles inline or in the _bootstrap-custom-variables.scss file
-custom fonts were installed into the app/fonts/bootstrap/ directory (must mkdir)  Use
.ttf or .woff formats
- used scaffold command $`rails g scaffold user first_name:string last_name:string email:string:uniq password_digest:string remember_token:string`
to generate User model for account management
- used generate controller sessions $`rails g controller sessions new create destroy` to create User account session manager






