# Build/Install  

Make sure you have rails -v Rails 5.1.6 and ruby -v ruby 2.4.1

1. `git clone https://github.com/aircert/bonobos-inventory.git`
    - Two folders under bonobos-inventory `cd bonobos-inventory`
2. Rails 5 API is located in server folder 
    - `cd server`
    - `bundle install`
    - `rails db:create db:migrate db:seed` - loads in the two .csv files to database
    - `rails s --port 3000` (listens on port 3000)
3. React client is in the client folder
    - Start with `cd client && npm install start` (listens on port 3001)
    - Make sure to select 'Y' for different port as our rails server is running on port 3000 already
    - `cd client && npm install && npm start` (listens on port 3001)
4. Test
    - `bundle exec rspec` in server folder. Search test is failing.


# Approach

My approach is to use the product_id as `product_key` as the foreign key to correlate the two csv files. 
1. create a Product model (the choice of product_* is redundant but is for readability from the .csv import script
    1. Has many items (item model)
2. Seed file with CSVs
3. Create rails 5 api 
    1. Serializers
4. The rest of the details are in the commit history

# Accomplishments
    - Rails 5 API (includes CRUD for products and items endpoints)
    - Ingestion script
    - RSPEC for both controllers (items and product)
    - Client Side React Fromework setup
    - Connected client with server
    - Show images in UI
    - Needs to be tested in RSPEC and implemented on client

# Future plans 
    - (AWS Image hosting and Upload from UI)
    - Creation of products and tasks on UI
    - Upload .csv via UI
    - Align buttons to bottom of product div
    - Refactor to pull out color into a picker on item; Group items by pant size and waist
    - Shell script to install dependencies
    - Docker container prebuilt
    - Left comments across code as well

# Known Bugs
- PROCFILE for forman start
- Search is not finding ‘washed chimps’ but works for absolute terms




