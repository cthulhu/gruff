
require File.dirname(__FILE__) + '/base'
require "json"


# OFC is Open Flash Chart
# This 

class Gruff::OFCBind

  def initialize dimensions = "", ofc_json = "" 
    begin
      @options = JSON.parse( ofc_json )
    rescue 
      @options = {"elements" => [ {"type" => "unknown" } ]}
    end
    @dimensions = dimensions.nil? || dimensions.empty? ? "200x200" : dimensions
    build_object
  end
  
  def method_missing name, *args
    @graph_object.send name, args
  end
protected
  def build_object
    case @options["elements"][0]["type"]
    when "bar_stack"
      @graph_object = Gruff::StackedBar.new( @dimensions )
    else
      @graph_object = Gruff::Line.new( @dimensions )
    end
#    @graph_object = 
#    @graph_object.theme = {
#      :marker_color => 'lightgray',
#      :background_colors => ['#F3F3F3', '#F3F3F3']
#    }

  end
  
end
