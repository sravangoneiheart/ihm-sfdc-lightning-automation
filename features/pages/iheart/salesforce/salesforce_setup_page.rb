class SalesforceSetupPage < WebPage

  text_field(:setup_search_field, :id => "setupSearch")
  button(:setup_search_button, :id => "setupSearchButton")

####Links in left pane of Setup page
  link(:users_link_in_the_manage_users_section, :id => "ManageUsers_font")
####Links in left pane of Setup page
#link(:users_link_in_the_manage_users_section, :id => "ManageUsers_font")
  link(:users_link_in_the_manage_users_section, :id => "Users_font")
  link(:customize_link_in_the_build_section, :id => "Customize_font")

  link(:leads_link_in_the_customize_section, :id => "Lead_font")
  link(:fields_link_in_the_leads_section, :id => "LeadFields_font")
  link(:lead_source_link_in_the_fields_section, :xpath => ".//*[@id='LayoutFieldList$RelatedStandardFieldsList_body']/table/tbody/tr[22]/th/a")
  link(:del_link_to_delete_an_inactive_value, :xpath => "//*[contains(@title,'Q1-2017 Renewal Campaign') and contains(@title,'Del')]")

  link(:accounts_link_in_the_customize_section, :id => "Account_font")
  link(:fields_link_in_the_accounts_section, :id => "AccountFields_font")
  link(:account_source_link_in_the_fields_section, :xpath => ".//*[@id='LayoutFieldList$RelatedStandardFieldsList_body']/table/tbody/tr[7]/th/a")

  link(:opportunity_link_in_the_customize_section, :id => "Opportunity_font")
  link(:fields_link_in_the_opportunity_section, :id => "OpportunityFields_font")
  link(:lead_source_link_in_the_opportunity_fields_section, :xpath => ".//*[@id='LayoutFieldList$RelatedStandardFieldsList_body']/table/tbody/tr[11]/th/a")

  link(:contacts_link_in_the_customize_section, :id => "Contact_font")
  link(:fields_link_in_the_contacts_section, :id => "ContactFields_font")
  link(:lead_source_link_in_the_contacts_fields_section, :xpath => ".//*[@id='LayoutFieldList$RelatedStandardFieldsList_body']/table/tbody/tr[22]/th/a")

# Name: form_field_order
  # Input: No input is needed.
  # Purpose: Fills the details of the various fields in required order

  def form_field_order
    %w{
        setup_search_field
    }
  end

  # Name: data_class
  # Input:  No input is needed.
  # Purpose: Return the data class for the page

  def self.data_class
    SalesforceSetupPageData
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





