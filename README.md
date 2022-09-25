# Limit/Offset Skips Records

The issue seems to be that, with a large dataset, ordering on a column that can have duplicate records causes (up to a point) the first record to be included in all responses, which replaces that record on subsequent pages when using limit/offset.
With 50 records, limiting/offsetting by 10, only the first page behaves this way.
With 200 records, limiting/offsetting by 10, only the first 9 pages behave this way.

## Dependencies

- Ruby 3.1.2
- PostgreSQL 14

## Set Up

- Install the gems
  - `bundle install`
- Set up the database
  - `bundle exec rails db:setup`

## Reproduction Via Console

- `bundle exec rails list:offset_ids`

## Reproduction Via Web

- Run the server
  - `bin/dev`
- Visit the functional page
  - `open http://localhost:3000`
- Scroll down and click the "Load more" button
- See the two lists match as more records are loaded
- Visit the functional page
  - `open http://localhost:3000/broken`
- Scroll down and click the "Load more" button
- See the two lists do not match as more records are loaded
  - Each page load skips one record in its response
  - The last ID on page one is 20, and the first ID in the next page is 22 (40/42 for the next page, and so on)
