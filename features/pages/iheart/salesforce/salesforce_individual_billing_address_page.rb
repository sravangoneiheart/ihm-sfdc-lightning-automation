class SalesforceIndividualBillingAddressPage < WebPage

  cell(:billing_address_name,:xpath=>"//*[@id='ep']/div[2]/div[2]/table/tbody/tr[1]/td[2]")
  # Name: form_field_order
  # Input: No input is needed.
  # Purpose: Fills the details of the various fields in required order
  link(:billing_address_account, :xpath => "html/body/div[1]/div[2]/table/tbody/tr/td[2]/div[4]/div[2]/div[2]/table/tbody/tr[2]/td[2]/a")
  cell(:billing_address_1,:xpath=>"//*[@id='ep']/div[2]/div[2]/table/tbody/tr[4]/td[2]")
  cell(:billing_address_2,:xpath=>"//*[@id='ep']/div[2]/div[2]/table/tbody/tr[5]/td[2]")
  cell(:billing_address_city,:xpath=>"//*[@id='ep']/div[2]/div[2]/table/tbody/tr[6]/td[2]")
  cell(:billing_address_state,:xpath=>"//*[@id='ep']/div[2]/div[2]/table/tbody/tr[7]/td[2]")
  cell(:billing_address_zip,:xpath=>"//*[@id='ep']/div[2]/div[2]/table/tbody/tr[8]/td[2]")
  cell(:billing_address_country,:xpath=>"//*[@id='ep']/div[2]/div[2]/table/tbody/tr[9]/td[2]")
  img(:billing_address_active,:src=>"/img/checkbox_checked.gif",:id=>'00NE0000005UEqo_chkbox')
  img(:billing_address_primary,:src=>"/img/checkbox_checked.gif",:id=>'00N0j000000HSCv_chkbox')
  img(:billing_address_active_atl,:src=>"/img/checkbox_checked.gif",:id=>'00NE0000005UEqo_chkbox')
  img(:billing_address_primary_atl,:src=>"/img/checkbox_checked.gif",:id=>'00N44000006b02v_chkbox')
  button(:edit,:name=>'edit')


  def form_field_order
    %w{
    }
  end

  # Name: data_class
  # Input:  No input is needed.
  # Purpose: Return the data class for the page

  def self.data_class
    SalesforceIndividualBillingAddressPageData
  end

  # Name: page_title_validation_value
  # Input: none
  # Purpose: return the validation value for the page title

  def self.page_title_validation_value
    /Billing Address/
  end

  # Name: page_url_validation_value
  # Input: none
  # Purpose: return the validation value for the page url

  def self.page_url_validation_value
    //
  end



end





