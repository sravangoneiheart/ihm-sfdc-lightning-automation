class SalesforceTTWNOrderEditPage < WebPage


  button(:save_button, :value => "Save")
  button(:cancel_button, :value => "Cancel")

  #Advertiser & Agency Info Section
  text_field(:account_name, :id => "j_id0:frm:pgBlk:AdvertiserAgencyInfoSection:j_id51:Advertiser")
  text_field(:advertiser_contact, :id => "j_id0:frm:pgBlk:AdvertiserAgencyInfoSection:advContactSect:advertiserContact")
  text_field(:agency_contact, :id => "j_id0:frm:pgBlk:AdvertiserAgencyInfoSection:agcyContactSect:agencyContact")
  text_field(:agency_advertiser_code, :id => "j_id0:frm:pgBlk:AdvertiserAgencyInfoSection:AgencyAdvertiserCode")
  text_field(:agency_product_code, :id => "j_id0:frm:pgBlk:AdvertiserAgencyInfoSection:AgencyProductCode")

  #Opportunity Information
  text_field(:opportunity_name, :id => "j_id0:frm:pgBlk:OpportunityInfoSection:j_id72")
  text_field(:opp_description, :id => "j_id0:frm:pgBlk:OpportunityInfoSection:j_id79")
  text_field(:agency_commission_trade_factor, :id => "j_id0:frm:pgBlk:OpportunityInfoSection:agencyCommissionBlock:agencyCommissionIn")
  select_list(:industry, :id => "j_id0:frm:pgBlk:OpportunityInfoSection:industry")
  select_list(:sub_industry, :id => "j_id0:frm:pgBlk:OpportunityInfoSection:subindustry")
  text_field(:gross_amount, :id => "j_id0:frm:pgBlk:OpportunityInfoSection:j_id73:j_id78")
  select_list(:stage, :id => "j_id0:frm:pgBlk:OpportunityInfoSection:stageField")
  text_field(:probability, :id => "j_id0:frm:pgBlk:OpportunityInfoSection:probabilityField")
  text_field(:close_date, :id => "j_id0:frm:pgBlk:OpportunityInfoSection:j_id81")
  select_list(:close_reason, :id => "j_id0:frm:pgBlk:OpportunityInfoSection:j_id82")
  text_field(:reason_explanation, :id => "j_id0:frm:pgBlk:OpportunityInfoSection:j_id84")
  text_field(:competitor, :id => "j_id0:frm:pgBlk:OpportunityInfoSection:j_id86")

  #Order Details
  text_field(:owner, :title => "Owner")
  text_field(:sam, :id => "j_id0:frm:pgBlk:orderDetailsSection:samPBS:sam1")
  text_field(:sam2, :id => "j_id0:frm:pgBlk:orderDetailsSection:sam2")
  text_field(:sam3, :id => "j_id0:frm:pgBlk:orderDetailsSection:sam3")
  text_field(:order_date, :id => "j_id0:frm:pgBlk:orderDetailsSection:j_id87")
  select_list(:order_type, :id => "j_id0:frm:pgBlk:orderDetailsSection:contractType")
  select_list(:classification, :id => "j_id0:frm:pgBlk:orderDetailsSection:j_id94")
  checkbox(:market_mobile, :id => "j_id0:frm:pgBlk:orderDetailsSection:j_id100")
  select_list(:allow_to_over_deliver, :id => "j_id0:frm:pgBlk:orderDetailsSection:j_id105:overDeliver")
  select_list(:monthly_flexibility_percentage, :id => "j_id0:frm:pgBlk:orderDetailsSection:j_id110:timeFlexibilityPct")
  text_area(:additional_info, :id => "j_id0:frm:pgBlk:orderDetailsSection:j_id113")

  #Billing
  text_area(:co_op, :id => "j_id0:frm:pgBlk:BillingSection:j_id115")
  select_list(:combo_bill, :id => "j_id0:frm:pgBlk:BillingSection:comboBill")
  select_list(:affiliate_billing_flexibility_percentage, :id => "j_id0:frm:pgBlk:BillingSection:affiliateFlexPercent")
  checkbox(:edi, :id => "j_id0:frm:pgBlk:BillingSection:EDI")
  select_list(:edi_variation, :id => "j_id0:frm:pgBlk:BillingSection:EDIVariance")
  text_field(:estimate_number, :id => "j_id0:frm:pgBlk:BillingSection:j_id116")
  checkbox(:display_isci_on_invoice, :id => "j_id0:frm:pgBlk:BillingSection:j_id117")
  text_area(:special_billing_instructions, :id => "j_id0:frm:pgBlk:BillingSection:billingInstr")

  #Alternate Billing Information
  text_area(:street, :id => "j_id0:frm:pgBlk:j_id118:j_id119")
  text_field(:city, :id => "j_id0:frm:pgBlk:j_id118:j_id121")
  select_list(:state, :id => "j_id0:frm:pgBlk:j_id118:j_id123")
  text_field(:zip, :id => "j_id0:frm:pgBlk:j_id118:j_id125")
  text_field(:contact, :id => "j_id0:frm:pgBlk:j_id118:j_id120")
  text_field(:phone, :id => "j_id0:frm:pgBlk:j_id118:j_id122")
  text_field(:email, :id => "j_id0:frm:pgBlk:j_id118:j_id124")

  #Billable Substitutions
  checkbox(:market, :id => "j_id0:frm:pgBlk:j_id126:j_id127")
  checkbox(:in_spec_overdelivery_across_the_month, :id => "j_id0:frm:pgBlk:j_id126:j_id129")
  checkbox(:reach_max, :id => "j_id0:frm:pgBlk:j_id126:j_id128")
  cell(:days_of_the_week_focus, :xpath => "//*[@id = 'j_id0:frm:pgBlk:j_id126:j_id130_unselected']/..")
  select_list(:days_of_the_week_available, :id => "j_id0:frm:pgBlk:j_id126:j_id130_unselected")
  select_list(:days_of_the_week_chosen, :id => "j_id0:frm:pgBlk:j_id126:j_id130_selected")
  image(:add_days_of_the_week, :id => "j_id0:frm:pgBlk:j_id126:j_id130_right_arrow")
  image(:remove_days_of_the_week, :id => "j_id0:frm:pgBlk:j_id126:j_id130_left_arrow")

  #Exclusions
  select_list(:holiday_exclusions_available, :id => "j_id0:frm:pgBlk:exclusionsSection:j_id131_unselected")
  select_list(:holiday_exclusions_chosen, :id => "j_id0:frm:pgBlk:exclusionsSection:j_id131_selected")
  image(:add_holiday_exclusions, :id => "j_id0:frm:pgBlk:exclusionsSection:j_id131_right_arrow")
  image(:remove_holiday_exclusions, :id => "j_id0:frm:pgBlk:exclusionsSection:j_id131_left_arrow")

  select_list(:controversial_programs_available, :id => "j_id0:frm:pgBlk:exclusionsSection:j_id135:controversial")
  select_list(:controversial_programs_excluded, :id => "j_id0:frm:pgBlk:exclusionsSection:j_id135:controversial2")
  image(:add_controversial_programs, :xpath => "//*[@id='j_id0:frm:pgBlk:exclusionsSection:j_id135:multiselectPanel']/table/tbody/tr[2]/td[2]/img[1]")
  image(:remove_controversial_programs, :xpath => "//*[@id='j_id0:frm:pgBlk:exclusionsSection:j_id135:multiselectPanel']/table/tbody/tr[2]/td[2]/img[2]")

  checkbox(:all_programs_excluded, :id => "j_id0:frm:pgBlk:exclusionsSection:j_id159:exclude")



  # Name: form_field_order
  # Input: No input is needed.
  # Purpose: Fills the details of the various fields in required order

  def form_field_order
    %w{
        sam
        order_type
        classification
        special_billing_instructions
    }
  end

  # Name: data_class
  # Input:  No input is needed.
  # Purpose: Return the data class for the page

  def self.data_class
    SalesforceTTWNOrderEditPageData
  end

  # Name: page_title_validation_value
  # Input: none
  # Purpose: return the validation value for the page title

  def self.page_title_validation_value
    /SPONSORSHIP ORDER AGREEMENT/
  end

  # Name: page_url_validation_value
  # Input: none
  # Purpose: return the validation value for the page url

  def self.page_url_validation_value
    /TTNOrderEdit?/
  end

end





