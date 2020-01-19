# Parking Lot

Backend service for a parking lot that has 54 spots.
Tickets are generated when the car enters and the exit time is marked.

## Setup

Make sure to have installed:
- Ruby 2.7.0
- Docker

To configure the service:
1. Run `bundle install` to install libraries and gems.
2. To start dependencies run `docker-compose up`
3. Make sure your database is up to date running the migrations
`bundle exec rake db:migrate`
4. Run the migrations in `test` env as well
`ENVIRONMENT=test bundle exec rake db:migrate`
5. Run the tests to check everything is working fine
`rspec spec`
