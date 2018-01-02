class SalesforceOpportunitiesPage < WebPage



  select_list(:view_dropdown, :id => "fcf")
  button(:view_dropdown_go_button, :value => " Go! ")

  ####Recent Opportunities Related List
  button(:new_opportunity_button, :name => "new")
  select_list(:display_selection_dropdown, :id => "hotlist_mode")
  table(:opportunity_table, :xpath => "//*[@class='bRelatedList']/div/div/div[2]/table")

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
    SalesforceOpportunitiesPageData
  end

  # Name: page_title_validation_value
  # Input: none
  # Purpose: return the validation value for the page title

  def self.page_title_validation_value
    /Recent Opportunities/
  end

  # Name: page_url_validation_value
  # Input: none
  # Purpose: return the validation value for the page url

  def self.page_url_validation_value
    /\/o$/
  end

end





