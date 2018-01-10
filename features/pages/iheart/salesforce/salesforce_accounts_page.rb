class SalesforceAccountsPage < WebPage




  select_list(:view_dropdown, :id => "fcf")
  button(:view_dropdown_go_button, :value => " Go! ")


####Recent Accounts Related List
  list_item(:new_button, :xpath => "//*[@id='brandBand_1']/div/div/div/div/div/div[1]/div[1]/div[2]/ul/li[1]")
  button(:next_button, :xpath => "/html/body/div[5]/div[2]/div[3]/div[2]/div/div[3]/div/button[2]")

  button(:candidate_search_button, :xpath => " //*[@id='pg:frm:j_id71:j_id72']/input[1]")
  link(:recent_account_link, :xpath =>"html/body/div[1]/div[2]/table/tbody/tr/td[2]/div[3]/div[1]/div/div[2]/table/tbody/tr[2]/th/a")


    #New Account Sub-page
    select_list(:account_record_type, :id => "p3")
    button(:continue_button, :value => "Continue")
    #
  # text_field(:account_name_search, :class => "searchStr")


   in_iframe(:id => /vfFrameId_\d+/) do |inner_frame|
     text_field(:account_name_search, :id => "pg:frm:txtAccountName", :frame => inner_frame)

   end

  in_iframe(:id => /vfFrameId_\d+/) do |inner_frame|
     button(:new_account, :class => 'btn newAccount', :frame => inner_frame)
  end




  #button(:new_account, :xpath => '//*[@id="pg:frm:j_id71:j_id72"]/input[3]')

  in_iframe(:id => /vfFrameId_\d+/) do |inner_frame|
    button(:more_button, :class => "btn tonextPage", :frame => inner_frame)
    button(:search_button, :css => "input.btn", :frame => inner_frame)
  end


  in_iframe(:id => /vfFrameId_\d+/) do |inner_frame|

  end

    # span(:name_search, :xpath => "//*[@id='pg:frm:j_id36']")
    #
## candidate serach values





####Reports Related List
  #link(:active_accounts_link, :)  holding on these elements for now as they require significant xpath


  # Name: form_field_order
  # Input: No input is needed.
  # Purpose: Fills the details of the various fields in required order


  def form_field_order
    %w{

    }
  end

  # Name: data_class
  # Input:  No input is needed.
  # Purpose: Return the data class for the page

  def self.data_class
    SalesforceAccountsPageData
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
    //
  end

  def get_table_header(table_name)
    header_array = []
    table = self.send(table_name + '_element')

    table[0].each do |row_cell|
      header_array.push(row_cell.text)
     end

    return header_array
  end

end





