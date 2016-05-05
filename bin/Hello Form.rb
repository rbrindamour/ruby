require 'sinatra'
require 'sinatra/reloader'
# require 'slim'

set :port, 8080
set :static, true
set :public_folder, "static"
set :views, "views"

#get '/' do
#  slim :index
#end

get '/' do
    return 'Hello world from web with SLIm commented'
end

get '/hello/' do
    erb :hello_form
end

post '/hello/' do
    greeting = params[:greeting] || "Hi There"
    name = params[:name] || "Nobody"
    comp_sel = params[:comp_sel] || "no component"
    sex = params[:sex] || "unknown"
 
    erb :index, :locals => {'greeting' => greeting, 'name' => name, 'comp_sel' => comp_sel, 'sex' => sex} 
end



#__END__
# 
#@@layout
#doctype html
#html
#  head
#    meta charset="utf-8"
#    title Just Do It
#    link rel="stylesheet" media="screen, projection" href="/styles.css"
#    /[if lt IE 9]
#      script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"
#  body
#    h1 Just Do It
#    == yield
# 
#@@index
#h2 My Tasks
#ul.tasks
#  li Get Milk