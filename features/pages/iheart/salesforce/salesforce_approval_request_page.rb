class SalesforceApprovalRequestPage < WebPage



  button(:approve_button, :name => "goNext")
  button(:reject_button, :name => "Reject")
  button(:cancel_button, :name => "cancel")


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
    SalesforceApprovalRequestPageData
  end

  # Name: page_title_validation_value
  # Input: none
  # Purpose: return the validation value for the page title

  def self.page_title_validation_value
    /Approve\/Reject Approval Request/
  end

  # Name: page_url_validation_value
  # Input: none
  # Purpose: return the validation value for the page url

  def self.page_url_validation_value
    /ProcessInstanceWorkitem/  #unfortunately the URLs for individual opportunity pages are dynamic, so a unique URL for validation does not exist
  end

end





