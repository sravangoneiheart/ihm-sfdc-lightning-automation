class SalesforceContactsPage < WebPage


#contact tab
link(:contact_tab, :id => "Contact_Tab")
button(:new_contact_button, :value => "New Contact")
text_field(:first_name, :xpath => "html/body/div[1]/div[2]/table/tbody/tr/td[2]/form/table/tbody/tr[3]/td[2]/span/input")
text_field(:last_name, :xpath => "html/body/div[1]/div[2]/table/tbody/tr/td[2]/form/table/tbody/tr[4]/td[2]/span/input")
text_field(:email, :xpath => "html/body/div[1]/div[2]/table/tbody/tr/td[2]/form/table/tbody/tr[5]/td[2]/span/input")
button(:new_contact, :name => "newContact")
text_field(:account_name, :id => "con4")
text_field(:title, :id => "con5")
checkbox(:credit_authorization, :id => "00NE0000005O8hV")
button(:save_contact_button, :name => "save")
link(:account_name_link, :xpath => "html/body/div[1]/div[2]/table/tbody/tr/td[2]/div[4]/div[2]/div[2]/table/tbody/tr[2]/td[2]/div/a")
button(:save_credit_inquiry_button, :name => "save")
#span(:accounts_market_link, :text => "AccountMarkets")

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
  SalesforceContactsPageData
end

# Name: page_title_validation_value
# Input: none
# Purpose: return the validation value for the page title

def self.page_title_validation_value
  /Account Detail/
end

# Name: page_url_validation_value
# Input: none
# Purpose: return the validation value for the page url

def self.page_url_validation_value
  /salesforce.com/  #unfortunately the URLs for individual account pages are dynamic, so a unique URL for validation does not exist
end

end