class SalesforceIndividualOpportunityPage < WebPage

  link(:opportunity_name_link, :xpath => "html/body/div[1]/div[2]/table/tbody/tr/td[2]/div[4]/div[2]/div[2]/table/tbody/tr[1]/td[2]/div/a")

  button(:edit_button, :xpath => "//*[@id='topButtonRow']/input[3]")

  button(:cancel_button, :vslur => "Cancel")

  #----------------------Added by Riaze --end





  # Test = 'test'
  # # @browser.url.to_s.split("/").last
  # cell(:total_gross_cost, :xpath => "//*[@id='"+Test+"_RelatedLineItemList_body']/table/tbody/tr[2]/td[3]")
  # #Subbu

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
    SalesforceIndividualOpportunityPageData
  end

  # Name: page_title_validation_value
  # Input: none
  # Purpose: return the validation value for the page title

  def self.page_title_validation_value
    Regexp.union(/Opportunity Detail/,/Budget Allocation/)
  end

  # Name: page_url_validation_value
  # Input: none
  # Purpose: return the validation value for the page url

  def self.page_url_validation_value
    Regexp.union(/salesforce.com/,/visual.force.com/)  #unfortunately the URLs for individual opportunity pages are dynamic, so a unique URL for validation does not exist
  end


  def capture_values
    @@gross_amount = gross_amount
  end

end





