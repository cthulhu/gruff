
require File.dirname(__FILE__) + "/gruff_test_case"

class TestOFCBind < GruffTestCase
  
  def test_stack_bars
    g = Gruff::OFCBind.new( "690x600", File.read( File.dirname(__FILE__) + '/ofc_bind_samples/stack_bar.json' ) )
    g.write('test/output/ofc_bind_stack_bar.png')
    g.to_blob    
  end

  def test_zero_values_bar
    g = Gruff::OFCBind.new( "690x600", File.read( File.dirname(__FILE__) + '/ofc_bind_samples/zero_values_bar.json' ) )
    g.write('test/output/ofc_bind_zero_values_bar.png')
    g.to_blob    
  end
  
  def test_lines
    g = Gruff::OFCBind.new( "690x600", File.read( File.dirname(__FILE__) + '/ofc_bind_samples/line.json' ) )
    g.write('test/output/ofc_bind_line.png')
    g.to_blob
  end
  
  def test_no_data
    g1 = Gruff::OFCBind.new()
    g1.write('test/output/ofc_bind_no_data1.png')
    g1.to_blob
    g2 = Gruff::OFCBind.new("500x500")
    g2.write('test/output/ofc_bind_no_data2.png')
    g2.to_blob
  end

end
