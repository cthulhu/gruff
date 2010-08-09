
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
    when "line"
      @graph_object = Gruff::Line.new( @dimensions )
    else
      @graph_object = Gruff::Line.new( @dimensions )
      return
    end
    # labels and axises
    
    @graph_object.minimum_value = @options["y_axis"]["min"]
    @graph_object.maximum_value = @options["y_axis"]["max"]
    @graph_object.y_axis_increment = @options["y_axis"]["steps"]
    @graph_object.show_x_axis_markers = true
    
    case @options["x_axis"]["labels"]["rotate"]
    when "diagonal"
      @graph_object.labels_rotation = -45
    end
    @options["x_axis"]["labels"]["labels"].each_with_index do |label, index|
      @graph_object.labels[ index ] = label
    end
    # theme pickup
    @graph_object.theme = {
      :marker_color => @options["x_axis"]["grid-colour"],
      :background_colors => [ @options["bg_colour"], @options["bg_colour"] ]
    }
    
    #title
    @graph_object.title = @options["title"]["text"]
    
    #data
    @graph_object.data_opacity = @options["elements"][0]["alpha"]
    if @options["elements"][0]["values"][0].is_a? Array
      (0..@options["elements"][0]["values"][0].size - 1).to_a.each do |data_item|
        name = ( @options["elements"][0]["values"].map{|col| col[data_item]["tip"].to_s.strip }.uniq.find{|i| i != "" } || "" ).scan( /([^<]*).*/ )
        @graph_object.data( 
          name, 
          @options["elements"][0]["values"].map{|col| col[data_item]["val"] }, 
          @options["elements"][0]["values"][0][data_item]["colour"] 
        )
      end
    else
      @graph_object.data( 
        @options["elements"][0]["text"], 
        @options["elements"][0]["values"], 
        @options["elements"][0]["colour"] 
      )
    end
   
  end
  
end