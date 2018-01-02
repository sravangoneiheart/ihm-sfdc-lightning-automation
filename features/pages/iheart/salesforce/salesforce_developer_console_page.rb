class SalesforceDeveloperConsolePage < WebPage

  text_field(:query_editor_space, :xpath => '//*[@id="queryEditorText-inputEl"]')
  span(:query_editor_button, :xpath => '//*[@id="tab-1173-btnInnerEl"]')
  button(:execute_button, :id => 'queryExecuteButton-btnEl')
  span(:refresh_grid, :id => 'button-1203-btnInnerEl')
  span(:open_details_page, :id => 'button-1207-btnInnerEl')
  div(:first_inject_in_grid, :xpath => '//*[@id="gridview-1197"]/table/tbody/tr[2]/td[3]/div')
  div(:debug, :id => 'debugMenuEntry')
  span(:window, :id => 'openExecuteAnonymousWindow-textEl')
  textarea(:apex_code, :xpath => 'html/body/div[1]/div[2]/div[3]/div[2]/div[2]/div[1]/div[1]/div/table[1]/tbody/tr/td[2]/textarea')
  button(:apex_execute, :xpath => 'html/body/div[1]/div[2]/div[3]/div[2]/div[2]/div[2]/div/div/div[1]/em/button')
  div(:status, :xpath => 'html/body/div[1]/div[2]/div[1]/div[2]/div/div/div/div[3]/div/table/tbody/tr[2]/td[4]/div')
  div(:datetime_stamp,:xpath=>'html/body/div[1]/div[2]/div[1]/div[2]//div[3]/div/table/tbody/tr[2]/td[1]/div')
  div(:row_1_col_1,:xpath=>'html/body/div[1]/div[2]/div[1]/div[2]/div/div/div/div[3]/div/table/tbody/tr[2]/td/div')

  link(:close_result,:xpath=>'html/body/div[1]/div[2]/div[1]/div[1]/div[1]/div[2]/div/div[1]/a')

  def form_field_order
    %w{

    }
  end

  # Name: data_class
  # Input:  No input is needed.
  # Purpose: Return the data class for the page

  def self.data_class
    SalesforceDeveloperConsolePageData
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
    //  #unfortunately the URLs for individual opportunity pages are dynamic, so a unique URL for validation does not exist
  end

end