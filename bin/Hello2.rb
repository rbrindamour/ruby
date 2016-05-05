#!/usr/bin/env ruby
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'

get '/hello/:name' do
  @name = params[:name].to_i * 5
  erb :hello
end

__END__
@@ layout
<html>
  <body>
   <%= yield %>
  </body>
</html>

@@ hello
<h3>Hello <%= @name %>!</h3>