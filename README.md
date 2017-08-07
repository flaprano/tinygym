Project developed using Ruby 2.4.1 and Rails 5.1.2

Obs.: The focus of the project was the back-end. The front-end was not developed.

Gems used on this project:

- bootstrap-sass (is on the project but not really used)
- devise (for creation of model User and registration/login/logout of users)
- geocoder (to find addresses by latitude/longitude)
- nested_form_fields (to create the forms of model Address linked to the models User and Gym)
- paperclip (is on the project but not really used)
- rails-i18n (is on the project but not really used)
- capybara (to test the project)
- factory_girl_rails (to support a better creation of objects on the tests)
- rspec-rails (to test the project)
- simplecov (to verify the percentage of test cover of the project)
- rubocop (to verify the quality of the code)

How to run:

- Clone the project
- Run the command: bundle install
- Run the command: rails db:migrate
- Project is ready to run