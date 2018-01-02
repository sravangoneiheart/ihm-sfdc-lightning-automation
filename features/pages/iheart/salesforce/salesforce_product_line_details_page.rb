class SalesforceProductLineDetailsPage < WebPage

  #### Schedules
  in_iframe(:id => "066E0000001H0lS") do |inner_frame|
  span(:first_gross_cost_value, :id => 'rfSchedRelLst:frm:j_id4:j_id10:0:grossRevText', :frame => inner_frame)
  end
  in_iframe(:id => "066E0000001H0lS") do |inner_frame|
  span(:second_gross_cost_value, :id => 'rfSchedRelLst:frm:j_id4:j_id10:1:grossRevText', :frame => inner_frame)
  end
  in_iframe(:id => "066E0000001H0lS") do |inner_frame|
  span(:third_gross_cost_value, :id => 'rfSchedRelLst:frm:j_id4:j_id10:2:grossRevText', :frame => inner_frame)
  end
  in_iframe(:id => "066E0000001H0lS") do |inner_frame|
  cell(:schedule_edit_button , :id => 'rfSchedRelLst:frm:j_id4:j_id5:btnEdit', :frame => inner_frame)
  end

  ## value fields for costing
  cell(:total_gross_cost_value_product, :xpath => "html/body/div[1]/div[2]/table/tbody/tr/td[2]/div[4]/div[2]/div[2]/table/tbody/tr[1]/td[4]")
  cell(:total_net_cost_value_product, :xpath => "html/body/div[1]/div[2]/table/tbody/tr/td[2]/div[4]/div[2]/div[2]/table/tbody/tr[2]/td[4]")
  button(:edit_button, :name => 'edit')
  link(:opportunity, :link_text => 'TestAcc201-Pranay Test-MMS')
  in_iframe(:id => "066E0000001H0lS") do |inner_frame|
    table(:schedules_size, :xpath => 'html/body/form/div[1]/div/div/div/div/div[2]/div/table', :frame => inner_frame)
  end
  cell(:weeks_value, :xpath => '//*[@id="ep"]/div[2]/div[2]/table/tbody/tr[8]/td[4]')
  # Name: form_field_order
  # Input: No input is needed.
  # Purpose: Fills the details of the various fields in required order

  ### line edit page
  text_field(:quantity, :id => '00NE0000004m6p3')
  button(:save_button, :name => 'save')
  text_field(:weeks, :id => '00NE00000069qWz')
  text_field(:gross_line_amount, :id => '00NE0000004m6ou')

  ### Edit schedule for budget
  text_field(:first_gross_cost, :id => 'rfSchedRelLst:frm:j_id9:pnlRecords:0:grossRev')
  cell(:save_gross_cost_button, :id => 'rfSchedRelLst:frm:j_id9:j_id10:bottom:btnSave')





  def form_field_order
    %w{

    }
  end

  # Name: data_class
  # Input:  No input is needed.
  # Purpose: Return the data class for the page

  def self.data_class
    SalesforceProductLineDetailsPage
  end

  # Name: page_title_validation_value
  # Input: none
  # Purpose: return the validation value for the page title

  def self.page_title_validation_value
    /Line Detail/
  end

  # Name: page_url_validation_value
  # Input: none
  # Purpose: return the validation value for the page url

  def self.page_url_validation_value
    /salesforce/
  end

end





