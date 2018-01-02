class SalesforceHomePage < WebPage

  page_url(salesforce_environment_url)

  link(:user_name_link, :href => "/_ui/core/userprofile/UserProfilePage")



  #sravan
  div(:user_navigation_button, :xpath => "//*[@id='userNavButton']")
  link(:logout_button, :xpath =>"//*[@id='userNav-menuItems']/a[4]")
  link(:setup_button, :xpath => "//*[@id='userNav-menuItems']/a[2]")
  div(:search_left_panel,:id=>'searchSidetabsDiv')
  select(:task_list,:id=>'tasklist_mode')

  ##Salesforce_lightning
  link(:switch_light_mode, :xpath => "//*[@id='userNav-menuItems']/a[4]")
  span(:lightning_mode, :xpath => "//*[@id='oneHeader']/div[1]/div/span[2]")

  button(:light_navigation_button, :xpath => "html/body/div[5]/div[1]/header/div[2]/span/ul/li[10]/button")
  link(:switch_classic_mode, :xpath => "html/body/div[5]/div[2]/div[5]/div[1]/div[1]/div/div[4]/a")

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
    SalesforceHomePageData
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





