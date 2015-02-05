#!/usr/bin/env ruby2.2.0
#has to be run with ruby 2.2.0
puts RUBY_VERSION
require 'rexml/document'
require 'find'
require 'time'
require 'rubygems'
require 'nokogiri'
require 'builder'

cardio = File.open("/home/rodb/Documents/Sports/Sports Tracker/rb2012-11-16-T.gpx")

#puts Nokogiri.methods

cardio_content = Nokogiri::XML(cardio)
cardio_content.elements.each {|x| puts x,"==========="}
# elements = Nokogiri::XML::Element.name #(cardio_content)

puts cardio_content.elements.respond_to?('children')
puts cardio_content.elements('gpx/metadata').each {|x| puts x.to_s[0..50]}
#puts cardio_content.elements.children.each {|x|  puts x }
#puts cardio_content.Element
#puts cardio_content.inspect
#do |xmlout|
##  puts xmlout.gpx
#end

#puts cardio_content

#(0..20).each {|x| puts cardio_content[x]}
#builder = Nokogiri::XML::Builder.new do |xml|
#  $abc = { 'version' => '99'}
#  puts $abc
#xml.gpx { #xml.$abc
#  #$abc
#  xml.version  '1.0'
#  xml.creator 'CardioTrainer - http://www.worksmartlabs.com/cardiotrainer'
#
##xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
##xmlns="http://www.topografix.com/GPX/1/0" 
##xsi:schemaLocation="http://www.topografix.com/GPX/1/0 
##http://www.topografix.com/GPX/1/0/gpx.xsd"
#    xml.trk {
#      xml.trkseg {
#       xml.trkpt {
# #xml.root {
#  #  xml.products {
#  #    xml.widget {
#  #      xml.id_ "10"
#  #      xml.name "Awesome widget"
#       }
#      }
#    }
#}
#  
#end
#puts builder.to_xml


#def product_xml
#  xml = Builder::XmlMarkup.new( :indent => 2 )
#  xml.instruct! :xml, :encoding => "ASCII"
#  xml.product do |p|
#    p.name "Test"
#  end
#end
#
#puts product_xml

#puts Nokogiri::XML::Element.class