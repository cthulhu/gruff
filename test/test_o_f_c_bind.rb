
require File.dirname(__FILE__) + "/gruff_test_case"

class TestOFCBind < GruffTestCase
  
  def test_stack_bars
    g = Gruff::OFCBind.new( "690x600", File.read( File.dirname(__FILE__) + '/ofc_bind_samples/stack_bar.json' ) )
    g.write('test/output/ofc_bind_stack_bar.png')
  end
  
  def test_lines
    g = Gruff::OFCBind.new( "690x600", File.read( File.dirname(__FILE__) + '/ofc_bind_samples/line.json' ) )
    g.write('test/output/ofc_bind_line.png')
  end
  
  def test_no_data
    g = Gruff::OFCBind.new()
    g.write('test/output/ofc_bind_no_data1.png')
    g = Gruff::OFCBind.new("500x500")
    g.write('test/output/ofc_bind_no_data2.png')
  end

end
