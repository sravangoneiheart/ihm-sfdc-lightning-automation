class SalesforceLoginPage < WebPage

  page_url(salesforce_environment_url)

  text_field(:username, :id => "username")
  text_field(:password, :id => "password")
  button(:login_button, :id => "Login")

  # Name: form_field_order
  # Input: No input is needed.
  # Purpose: Fills the details of the various fields in required order

  def form_field_order
    %w{
        username
        password
    }
  end

  # Name: data_class
  # Input:  No input is needed.
  # Purpose: Return the data class for the page

  def self.data_class
    SalesforceLoginPageData
  end

  # Name: page_title_validation_value
  # Input: none
  # Purpose: return the validation value for the page title

  def self.page_title_validation_value
    /salesforce/
  end

  # Name: page_url_validation_value
  # Input: none
  # Purpose: return the validation value for the page url

  def self.page_url_validation_value
    /test.salesforce.com/
  end

end





