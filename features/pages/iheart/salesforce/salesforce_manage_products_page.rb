class SalesforceManageProductsPage < WebPage


  button(:broadcast_button, :xpath => "html/body/div[1]/div[2]/table/tbody/tr/td[2]/form/span/div[1]/div/div/div/div[1]/span/table/tbody/tr[1]/td[2]/input")
  button(:digital_button, :xpath => "html/body/div[1]/div[2]/table/tbody/tr/td[2]/form/span/div[1]/div/div/div/div[1]/span/table/tbody/tr[2]/td[2]/input")
  button(:mis_button, :xpath => "html/body/div[1]/div[2]/table/tbody/tr/td[2]/form/span/div[1]/div/div/div/div[1]/span/table/tbody/tr[3]/td[2]/input")
  button(:streaming_button, :xpath => "html/body/div[1]/div[2]/table/tbody/tr/td[2]/form/span/div[1]/div/div/div/div[1]/span/table/tbody/tr[4]/td[2]/input")

  select_list(:first_station, :xpath =>'html/body/div[1]/div[2]/table/tbody/tr/td[2]/form/span/div[2]/div/div/div/div[2]/table/tbody/tr[3]/td[7]/div/select')
  select_list(:second_station, :xpath =>'html/body/div[1]/div[2]/table/tbody/tr/td[2]/form/span/div[2]/div/div/div/div[2]/table/tbody/tr[2]/td[7]/div/select')
  select_list(:third_station, :xpath =>'html/body/div[1]/div[2]/table/tbody/tr/td[2]/form/span/div[2]/div/div/div/div[2]/table/tbody/tr[1]/td[7]/div/select')


  select_list(:digital_asset, :xpath => 'html/body/div[1]/div[2]/table/tbody/tr/td[2]/form/span/div[2]/div/div/div/div[2]/table/tbody/tr[2]/td[8]/div/select')

  select_list(:first_revenue_type, :xpath => 'html/body/div[1]/div[2]/table/tbody/tr/td[2]/form/span/div[2]/div/div/div/div[2]/table/tbody/tr[3]/td[9]/div/select')
  select_list(:second_revenue_type, :name => 'j_id0:j_id3:selected:j_id45:1:j_id85')
  select_list(:third_revenue_type, :xpath => 'html/body/div[1]/div[2]/table/tbody/tr/td[2]/form/span/div[2]/div/div/div/div[2]/table/tbody/tr[1]/td[9]/div/select')


  text_field(:first_gross_line_amount, :xpath => 'html/body/div[1]/div[2]/table/tbody/tr/td[2]/form/span/div[2]/div/div/div/div[2]/table/tbody/tr[3]/td[11]/div/input')
  text_field(:second_gross_line_amount, :xpath => ".//*[@id='j_id0:j_id3:selected:j_id45:1:productAmount']")
  text_field(:third_gross_line_amount, :xpath => "//*[@id='j_id0:j_id3:selected:j_id45:0:productAmount']")

  text_field(:first_start_date, :xpath => '//*[@id="j_id0:j_id3:selected:j_id45:2:j_id101"]')
  text_field(:second_start_date, :xpath => "//*[@id='j_id0:j_id3:selected:j_id45:1:j_id101']")
  text_field(:third_start_date, :xpath => "//*[@id='j_id0:j_id3:selected:j_id45:0:j_id101']")



  text_field(:first_end_date, :xpath => 'html/body/div[1]/div[2]/table/tbody/tr/td[2]/form/span/div[2]/div/div/div/div[2]/table/tbody/tr[3]/td[13]/div/span/input')
  text_field(:second_end_date, :xpath => 'html/body/div[1]/div[2]/table/tbody/tr/td[2]/form/span/div[2]/div/div/div/div[2]/table/tbody/tr[2]/td[13]/div/span/input')
  text_field(:third_end_date, :xpath => 'html/body/div[1]/div[2]/table/tbody/tr/td[2]/form/span/div[2]/div/div/div/div[2]/table/tbody/tr[1]/td[13]/div/span/input')

  button(:save_button,:value=> 'Save')
  # Name: form_field_order
  # Input: No input is needed.
  # Purpose: Fills the details of the various fields in required order

  def form_field_order
    %w{
       first_station
       first_revenue_type
       first_start_date
       first_gross_line_amount
       first_end_date
       second_station
       digital_asset
       second_revenue_type
       second_start_date
       second_end_date
       mis_button
       third_station
       third_revenue_type
       third_gross_line_amount
       third_start_date
       third_end_date
       save_button
   }
  end

  # Name: data_class
  # Input:  No input is needed.
  # Purpose: Return the data class for the page

  def self.data_class
    SalesforceManageProductsPageData
  end

  # Name: page_title_validation_value
  # Input: none
  # Purpose: return the validation value for the page title

  def self.page_title_validation_value
    //
  end

  # Name: page_url_validation_value
  # Input: none
  # Purpose: return the validation value for the page url

  def self.page_url_validation_value
    /Opportunity_Product_Entry\?/
  end

end