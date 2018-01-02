class SalesforceAccountsPage < WebPage




  select_list(:view_dropdown, :id => "fcf")
  button(:view_dropdown_go_button, :value => " Go! ")


####Recent Accounts Related List
  button(:new_button, :value => " New ")
  link(:recent_account_link, :xpath =>"html/body/div[1]/div[2]/table/tbody/tr/td[2]/div[3]/div[1]/div/div[2]/table/tbody/tr[2]/th/a")

    #New Account Sub-page
    select_list(:account_record_type, :id => "p3")
    button(:continue_button, :value => "Continue")
    #
    text_field(:account_name_search, :id => "pg:frm:txtAccountName")
    button(:more_button, :value => "More")
    #
## candidate serach values
  text_field(:address_name_search, :name =>"pg:frm:j_id49")
  text_field(:city_name,:name => "pg:frm:j_id55")
  text_field(:state_name, :name => "pg:frm:j_id61")
  text_field(:zip_postal_code, :name => "pg:frm:j_id52")
  text_field(:phone_number, :name => "pg:frm:j_id58")
  #
    button(:search_button, :value => "Search")
    button(:new_account_button, :value => "New Account")


  div(:recent_accounts_related_list, :class => "bPageBlock brandSecondaryBrd secondaryPalette")
  #Subbu 8/12/2016 - Removed the duplicate element
  # button(:new_account_button, :name => "new")
  select_list(:recently_viewed_dropdown, :id => "hotlist_mode")

  table(:account_table, :xpath => "//*[@class='bRelatedList']/div/div/div[2]/table")

  #Subbu 08/12/2016 - Adding new element for another searcch button on same page
  button(:candidate_search_button, :xpath => " //*[@id='pg:frm:j_id71:j_id72']/input[1]")

  checkbox(:do_not_call_1,:xpath=>"//*[@id='pg:frm:resultBlock:j_id81:0:j_id94']/input")
  label(:active_divisions_1,:xpath=>'html/body/div[1]/div[2]/table/tbody/tr/td/form/div[1]/div/div/div/div/div[2]/table/tbody/tr/td[13]/label')
  label(:account_record_type_1,:xpath=>'html/body/div[1]/div[2]/table/tbody/tr/td/form/div[1]/div/div/div/div/div[2]/table/tbody/tr[1]/td[6]/label')
  table(:account_list,:id=>'pg:frm:resultBlock:j_id81')



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
   /Recent Accounts/
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





