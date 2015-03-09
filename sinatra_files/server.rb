require 'pg'
require 'csv'
require 'dotenv'
Dotenv.load
require 'omniauth-github'
require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/reloader'
require 'oauth'
require 'json'
require 'yelp'


configure :development, :test do
  require 'pry'
end

configure do
  set :views, 'app/views'
end

Dir[File.join(File.dirname(__FILE__), 'app', '**', '*.rb')].each do |file|
  require file
  also_reload file
end


#############
# User Auth #
#############
def yelp_client
  client = Yelp::Client.new({ consumer_key: 't1_nA-JKOW8bMfUPU4E2Og',
                              consumer_secret: 'qA5n9hJeIlxhrTg9tqbmrhpJbUA',
                              token: 'Jke9KKd71wZlv_83qKEmLGThRc2plbRP',
                              token_secret: 'EF5RODrw6Hgvn9v0dEnpAm97z7k'
                            })
end

def get_yelp_data
  #data = yelp_client.search("San Francisco")
  #Sort mode: 0=Best matched (default), 1=Distance, 2=Highest Rated.
  #Sort by distance is only supported for a location or geographic search.
  #Search radius in meters. If the value is too large, a AREA_TOO_LARGE error may be returned. The max value is 40000 meters (25 miles).
  #Deals: Whether to exclusively search for businesses with deals
  data = yelp_client.search("Boston", { term: 'restaurants', sort: 2, deals_filter: true }).to_json
  # limit: 5, sort: 2, radius_filter: 25, deals_filter: false 
  data = JSON.parse(data).to_a

  binding.pry
end
get_yelp_data

configure do
  enable :sessions
  set :session_secret, ENV['SESSION_SECRET']

  use OmniAuth::Builder do
    provider :github, ENV['GITHUB_ID'], ENV['GITHUB_SECRET']
  end
end

def find_or_create_by(auth)
 # hit database and if it finds a user, return
 # otherwise create the user
end

#############
#  Database #
#############


#############
#  Routes   #
#############

get '/' do
  # @uploader = AvatarUploader.new
  # @uploader.retrieve_from_store!('http://https://s-media-cache-ak0.pinimg.com/236x/5a/42/c6/5a42c6224e3ce7fa9837965270bfcdd9.jpg')
  @data = get_yelp_data

  # binding.pry

  #@chicken_parm[2][1][0]["rating"]

  erb :home
end

post '/search/:term' do
  binding.pry
  @term = params['']

  redirect '/'
end

get '/login' do
  

  erb :login
end

get '/auth/github/callback' do
  auth = env['omniauth.auth']
  # binding.pry
  # create_user(auth)
  redirect '/'
end

# get '/recipe' do

#   ingredients = show_items(items)

#   erb :ingredients, locals: { ingredients: ingredients, error: error }
# end

post '/user/new' do
  user = params["username"]

  # if submission_input_valid?(ingredient)
  #   add_item(item)
  #   redirect '/recipe'
  # else
  #   error = "Please input an item"
  #   ingredients = show_items(items)

  #   erb :ingredients, locals: { error: error, ingredients: ingredients }
  # end
  # binding.pry

  redirect '/'
end

#option to have random food selector based on what you feel like eating
#sorts from highest ratings first and then goes down

#search by deals
#menus


###################################################################

# def get_ingredients_from_csv
#   ingredients = CSV.read('./ingredients.csv')
# end

def db_connection
  begin
    connection = PG.connect(dbname: 'lets_meat')
    yield(connection)
  ensure
    connection.close
  end
end

# def csv_to_db(arr)
#   arr.each do |ingredient_arr|
#     db_connection do |conn|
#       conn.exec("INSERT INTO ingredients (name) VALUES ($1)", [ingredient_arr[1]])
#     end
#   end
# end

def get_items_from_db(items)
  items = db_connection do |conn|
    conn.exec("SELECT name FROM #{items}")
  end
end

def show_items(items)
  items = db_connection do |conn|
    conn.exec("SELECT name FROM #{items}")
  end

  ingredients.to_a
end

def add_item(item, table_name)
  db_connection do |conn|
    conn.exec("INSERT INTO #{table_name} (name) VALUES ($1)", [item])
  end
end

def submission_input_valid?(item)
  !item.empty?
end

def create_new_user

end

def find_all_users
  users = db_connection do |conn|
    conn.exec('SELECT * FROM users')
  end

  users.to_a
end

def add_user(username, password)
  db_connection do |conn|
    conn.select('INSERT into users (username')
  end
end