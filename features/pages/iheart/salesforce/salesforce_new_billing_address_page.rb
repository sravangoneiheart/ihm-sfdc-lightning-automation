class SalesforceNewBillingAddressPage < WebPage

  button(:save_button, :value => "Save")
  button(:cancel_button, :value => "Cancel")

  button(:verify_addres_button, :value => "Verify Address")  #only button used on subsequent page

  checkbox(:use_legal_address_as_billing_address, :name => "chkapplyLegalAddress")
  checkbox(:zipcode, :name => 'j_id0:j_id1:j_id28:j_id32:j_id149')


  text_field(:address1, :id => "pageId:frmBilling:pageblockId:pageBlockSectionid:pageBlockrepeatid:1:ba_ConfirmationAddress")
  text_field(:address3, :id => "pageId:frmBilling:pageblockId:pageBlockSectionid:pageBlockrepeatid:2:ba_ConfirmationAddress")
  text_field(:city, :id => "pageId:frmBilling:pageblockId:pageBlockSectionid:pageBlockrepeatid:3:ba_ConfirmationAddress")
  select_list(:state_province, :id => "pageId:frmBilling:pageblockId:pageBlockSectionid:pageBlockSectionStateId:ba_state")
  text_field(:zip_postal_code, :id => "pageId:frmBilling:pageblockId:pageBlockSectionid:pageBlockSectionZipId:bmZipCodeBilling")
  select_list(:country, :id => "pageId:frmBilling:pageblockId:pageBlockSectionid:pageBlockSectionCountryId:ba_country")
  text_field(:contact, :id => "pageId:frmBilling:pageblockId:pageBlockSectionid:j_id47:ba_contact")
  checkbox(:active_checkbox, :value => "1")
  link(:account_link ,:xpath => 'html/body/div[1]/div[2]/table/tbody/tr/td[2]/div[4]/div[2]/div[2]/table/tbody/tr[2]/td[2]/a')

  #new billing address for netsuite

  text_field(:billing_name, :id => "pageId:frmBilling:pageblockId:pageBlockSectionid:pageBlockrepeatid:0:ba_ConfirmationAddress")
  text_field(:billing_email, :id => "pageId:frmBilling:pageblockId:pageBlockSectionid:pageBlockSectionBillingEmailId:bmBillingEmail")
  text_field(:address, :id => "pageId:frmBilling:pageblockId:pageBlockSectionid:pageBlockrepeatid:4:ba_ConfirmationAddress")

  text_field(:address_2, :id => "pageId:frmBilling:pageblockId:pageBlockSectionid:pageBlockrepeatid:5:ba_ConfirmationAddress")
  text_field(:city_1, :id => "pageId:frmBilling:pageblockId:pageBlockSectionid:pageBlockrepeatid:6:ba_ConfirmationAddress")
  div(:error_message, :id => "pageId:frmBilling:j_id9:j_id10:j_id11:0:j_id12:j_id13:j_id15")


  #AR contacts
  text_field(:ar_contact_name, :id => "pageId:frmBilling:pageblockId:pageBlockSectionContactInfoid:pageBlockrepeatid:0:ba_ConfirmationAddress")
  text_field(:ar_contact_title, :id => "pageId:frmBilling:pageblockId:pageBlockSectionContactInfoid:pageBlockrepeatid:2:ba_ConfirmationAddress")
  text_field(:ar_contact_phone, :id => "pageId:frmBilling:pageblockId:pageBlockSectionContactInfoid:pageBlockrepeatid:4:ba_ConfirmationAddress")
  text_field(:ar_contact_email, :id => "pageId:frmBilling:pageblockId:pageBlockSectionContactInfoid:pageBlockrepeatid:6:ba_ConfirmationAddress")
  text_field(:ar_alternate_contact_name, :id => "pageId:frmBilling:pageblockId:pageBlockSectionContactInfoid:pageBlockrepeatid:1:ba_ConfirmationAddress")
  text_field(:ar_alternate_contact_title, :id => "pageId:frmBilling:pageblockId:pageBlockSectionContactInfoid:pageBlockrepeatid:3:ba_ConfirmationAddress")
  text_field(:ar_alternate_contact_phone, :id => "pageId:frmBilling:pageblockId:pageBlockSectionContactInfoid:pageBlockrepeatid:5:ba_ConfirmationAddress")
  text_field(:ar_alternate_contact_email, :id => "pageId:frmBilling:pageblockId:pageBlockSectionContactInfoid:pageBlockrepeatid:7:ba_ConfirmationAddress")
  div(:email_error, :xpath => "//*[@id='pageId:frmBilling:j_id9:j_id10:j_id11:0:j_id12']/div")
  div(:email_error_2, :xpath => "html/body/div[1]/div[2]/table/tbody/tr/td[2]/form/span/div[2]/div/div/div/div/div[2]/div[1]/div[2]/table/tbody/tr[12]/td/span/div/div[2]")
  cell(:primary, :xpath => "//*[@id='00NV00000010RNp_chkbox']")
  checkbox(:active_checkbox, :value => "1")
  link(:back_to_account, :xpath =>"html/body/div[1]/div[2]/table/tbody/tr/td[2]/div[4]/div[2]/div[2]/table/tbody/tr[2]/td[2]/a")

  #Subbu 08/15/2106
  button(:accept_changes_button, :value => "Accept changes")

  # Name: form_field_order
  # Input: No input is needed.
  # Purpose: Fills the details of the various fields in required order
  link(:account_hyperlink, :xpath => "/0012C000006GP7I")



  def form_field_order
    %w{
        address1
        address_2
        city
        state_province
        zip_postal_code
        billing_name
        billing_email
        city_1
        address
        ar_contact_name
        ar_contact_title
        ar_contact_phone
        ar_contact_email
        ar_alternate_contact_name
        ar_alternate_contact_title
        ar_alternate_contact_phone
        ar_alternate_contact_email


    }
  end

  # Name: data_class
  # Input:  No input is needed.
  # Purpose: Return the data class for the page

  def self.data_class
    SalesforceNewBillingAddressPageData
  end

  # Name: page_title_validation_value
  # Input: none
  # Purpose: return the validation value for the page title

  def self.page_title_validation_value
    /New Billing Address/
  end

  # Name: page_url_validation_value
  # Input: none
  # Purpose: return the validation value for the page url

  def self.page_url_validation_value
    /NewBillingAddress?/
  end

  def capture_values
    @@address1 = address1
    @@city = city
    @@state_province = state_province
    @@zip_postal_code = zip_postal_code

    @@new_address = @@address1 + " " + @@city + " " + @@state_province + " " + @@zip_postal_code
  end

  #<%= GRPProposalBillingOptionsPage.class_eval("@@bill_to") =>
#*******************Riaze
  # Name: billing_sfdc
  # Input: none
  # Purpose: return the validation value for the page url

  def billing_sfdc
    billing_sfdc = @browser.url.split('/')[-1]
  end

  # Name: billing_sfdc_element
  # Input: none
  # Purpose: return the  url

  def billing_sfdc_element
    @browser.url
  end

#*******************Riaze

end





