class SalesforceNewOpportunityPage < WebPage



  list_item(:new_button, :class => "slds-button slds-button--neutral slds-truncate")
  button(:next_button, :xpath => "/html/body/div[5]/div[2]/div[3]/div[2]/div/div[3]/div/button[2]")





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
    SalesforceNewOpportunityPageData
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

end





