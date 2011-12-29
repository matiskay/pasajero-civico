require 'sinatra'
require 'redis'
require 'json'

$redis = Redis.new(:db => 5)

# set utf-8 for outgoing
before do
  headers "Content-Type" => "text/html; charset=utf-8"
end

# helper
def get_redis_json(id)

  fields = ['id', 'title', 'desc', 'lat', 'lon']

  json = {}

  is_set_point = $redis.get("point:#{id}:id")
  if is_set_point 
    fields.each do |field|
      json[field] = $redis.get("point:#{id}:#{field}")
    end   

    return json.to_json
  end
  
  return false

end

get '/' do
  haml :form, :format => :html5
end

get '/api/getpoint/:id' do
  @id = params[:id]
  @json = get_redis_json() 
  haml :index, :format => :html5
end

get '/api/getpoints' do
end

post '/api/submit' do
  id = $redis.incr "next.point.id"
  @title = params[:post][:title]
  @desc = params[:post][:description]
  @lat = params[:post][:lat]
  @lon = params[:post][:lon]

  $redis.set("point:#{id}:id", id)
  $redis.set("point:#{id}:title", @title)
  $redis.set("point:#{id}:desc", @desc)
  $redis.set("point:#{id}:lat", @lat)
  $redis.set("point:#{id}:lon", @lon)
  
  @json = get_redis_json(id)

  haml :debug
end

get '/test' do
  content_type :json
  { :key => 'value1', :key2 => 'value2' }.to_json
end
