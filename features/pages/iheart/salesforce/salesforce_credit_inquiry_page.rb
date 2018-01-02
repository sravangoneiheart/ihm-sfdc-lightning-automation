class SalesforceCreditInquiryPage < WebPage


select_list(:revenue_path, :id => "00NE0000005O8uf")
select_list(:credit_type, :id => "00NE0000005O8ty")
text_field(:contact, :id => "CF00NE0000005O8tt")
text_field(:project_startdate, :id => "00NE0000005O8uL")
text_field(:requested_limit, :id => "00NE0000005O8ua")
select_list(:requested_terms, :id => "00NE0000005O8ub")
button(:save_button, :value => " Save ")
text_field(:last_name, :id => "name_lastcon2")
list_item(:accounts_tab, :id => "Account_Tab")
link(:agency_lookup, :xpath => "//*[@id='CF00NE0000005O8uZ_lkwgt']/img/..")
div(:status, :id => "00NE0000005O8uj_ileinner")
div(:error_message, :id => "errorDiv_ep")
div(:error_message_2, :xpath => "//*[@id='ep']/div[2]/div[4]/table/tbody/tr[5]/td[4]/div/div[2]")
button(:edit_button, :value => " Edit ")
text_field(:approved_limit, :id => "00NE0000005O8ti")
select_list(:approved_terms, :id => "00NE0000005O8tj")
checkbox(:agree_with_decision, :id => "00NE0000005O8tW")
link(:contact_link, :xpath => "html/body/div[1]/div[2]/table/tbody/tr/td[2]/div[4]/div[2]/div[5]/table/tbody/tr[10]/td[2]/div/a")
link(:credit_inquiry_link, :xpath => "html/body/div[1]/div[2]/table/tbody/tr/td[2]/div[12]/div[1]/div/form/div[2]/table/tbody/tr[2]/th/a")
checkbox(:inactive, :id => "00NE0000000n8Ek")
text_field(:contact_first_name,:id => "00N0j000000HhoU")
text_field(:contact_last_name,:id => "00N0j000000HhoV")
text_field(:contact_title,:id => "00N0j000000HhoX")
text_field(:contact_email,:id => "00N0j000000HhoT")
text_field(:contact_phone,:id => "00N0j000000HhoW")




in_frame(:id => "resultsFrame") do |frame|

  link(:agency_select, :xpath => "//*[@id='Account_body']/table/tbody/tr[2]/th/a", :frame => frame)

end

div(:user_navigation_button, :xpath => "//*[@id='userNavButton']")
link(:logout_button, :xpath =>"//*[@id='userNav-menuItems']/a[4]")
link(:setup_button, :xpath => "//*[@id='userNav-menuItems']/a[2]")

  # Name: form_field_order
  # Input: No input is needed.
  # Purpose: Fills the details of the various fields in required order

  def form_field_order
    %w{
       revenue_path
       credit_type
       project_startdate
       requested_limit
       requested_terms
       contact_first_name
       contact_last_name
       contact_title
       contact_email
       contact_phone
    }
  end

  # Name: data_class
  # Input:  No input is needed.
  # Purpose: Return the data class for the page

  def self.data_class
    SalesforceCreditInquiryPageData
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
    /a1U/
  end

end




