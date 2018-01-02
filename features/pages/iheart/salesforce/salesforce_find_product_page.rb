class SalesforceFindProductPage < WebPage


  checkbox(:comedy_mf_overnight, :id => "01uE0000003JyYS")
  checkbox(:minute_rundown, :id => "01uE0000007qTcu")

  button(:select_button, :value => "Select")
  text_field(:gross_line_amount, :xpath => "html/body/div[1]/div[2]/table/tbody/tr/td[2]/form/table/tbody/tr[5]/td[3]/input")
  text_field(:start_date, :xpath => "html/body/div[1]/div[2]/table/tbody/tr/td[2]/form/table/tbody/tr[5]/td[4]/span/input")
  text_field(:no_of_weeks, :xpath => "html/body/div[1]/div[2]/table/tbody/tr/td[2]/form/table/tbody/tr[5]/td[5]/input")
  text_field(:end_date, :xpath => "html/body/div[1]/div[2]/table/tbody/tr/td[2]/form/table/tbody/tr[5]/td[6]/span/input")
  button(:save_button, :value =>" Save ")
  text_field(:by_keyword, :xpath => ".//*[@id='search']")
  button(:search_button, :name=> "saveButton")
  checkbox(:budget, :id => "01uE0000003pHEy")
  span(:budget_error_message, :xpath => "//*[@id='editPage']/table/tbody/tr[5]/td[26]/span")
  text_field(:market_screen_reports, :id => "CF00NE0000004m6oz01uE0000007qTcu")
  text_field(:start_date_report, :id => "00NE0000004m6pA01uE0000007qTcu")







  # Name: form_field_order
  # Input: No input is needed.
  # Purpose: Fills the details of the various fields in required order

  def form_field_order
    %w{
      by_keyword
      search_button
      budget
      comedy_mf_overnight
      select_button
      gross_line_amount
      start_date
      no_of_weeks
      end_date
      save_button


   }
  end

  # Name: data_class
  # Input:  No input is needed.
  # Purpose: Return the data class for the page

  def self.data_class
    SalesforceFindProductPageData
  end

  # Name: page_title_validation_value
  # Input: none
  # Purpose: return the validation value for the page title

  def self.page_title_validation_value
    /Find Products/
  end

  # Name: page_url_validation_value
  # Input: none
  # Purpose: return the validation value for the page url

  def self.page_url_validation_value
    /SelectSearch\?/
  end

end





