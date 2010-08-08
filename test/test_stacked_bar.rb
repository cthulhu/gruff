#!/usr/bin/ruby

require File.dirname(__FILE__) + "/gruff_test_case"

class TestGruffStackedBar < GruffTestCase

  def setup
    @datasets = [
      [:Jimmy, [25, 36, 86, 39]],
      [:Charles, [80, 54, 67, 54]],
      [:Julie, [22, 29, 35, 38]],
      ]
    @sample_labels = {
        0 => '5/6', 
        1 => '5/15', 
        2 => '5/24'
      }      

  end

  def test_bar_graph
    g = Gruff::StackedBar.new
    g.title = "Visual Stacked Bar Graph Test"
    g.labels = {
      0 => '5/6', 
      1 => '5/15', 
      2 => '5/24', 
      3 => '5/30', 
    }
    @datasets.each do |data|
      g.data(data[0], data[1])
    end
    g.write "test/output/stacked_bar_keynote.png"
  end


  def test_bar_graph_small
    g = Gruff::StackedBar.new(400)
    g.title = "Visual Stacked Bar Graph Test"
    g.labels = {
      0 => '5/6', 
      1 => '5/15', 
      2 => '5/24', 
      3 => '5/30', 
    }
    @datasets.each do |data|
      g.data(data[0], data[1])
    end
    g.write "test/output/stacked_bar_keynote_small.png"
  end
  
  def test_bars_with_opacity_and_custom_colors
    g = Gruff::StackedBar.new( "390x300" )
    data = []
    (0..30).to_a.each do |month|
      g.labels[ month ] = sprintf( "%02d", month + 1 )
      data << rand() * 30
    end
    g.show_x_axis_markers = true
    g.marker_font_size = 27.0
    g.legend_font_size = 30.0

    g.labels_rotation = -45
    g.label_margin = 25
    g.bottom_margin = 10

    g.theme = {
      :marker_color => 'lightgray',
      :background_colors => ['#F3F3F3', '#F3F3F3']
    }

    g.data("Apples", data, "#FF7900" )
    g.data("Apples1", data, "red" )
    g.data("Apples1", data, "green" )
    g.data("Apples1", data, "blue" )
    g.write "test/output/stacked_bar_with_opacity_and_custom_colors.png"
  end
  
end
