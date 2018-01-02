class SalesforceNewOpportunityEditPage < WebPage



####Opportunity Information Fields
  text_field(:account_name, :id => "opp4")
  text_field(:opportunity_name, :id => "opp3")
  text_field(:opp_description, :id => "00NE0000000WmXy")    #:tabindex => "3")          ####:xpath => "//*[@value => 'opp3']/../../../following-sibling/td[2]/div/input")
  select_list(:agency_or_direct, :id => "00NE0000004m6Pz")
  #div(:agency_commission_value, id => "00NE0000005UEs5_ileinner")
  select_list(:industry, :id => "00NE0000004m6oj")     #:tabindex => "5")       ####:xpath => "//*[@value => 'opp3']/../../../following-sibling[5]/td[2]/div/span/select")
  select_list(:sub_industry, :id => "00NE0000004m6oq") #:tabindex => "6")   ####:xpath => "//*[@value => 'opp3']/../../../following-sibling[6]/td[2]/div/span/span/select")
  select_list(:selling_office, :id => "00NE0000000nGs3")
  select_list(:population_type, :id => "00NE0000004m6oo")
  select_list(:division ,:id => '00NE0000005T8qY')
  checkbox(:mmp,:id => '00NE0000005Wq9i')
  text_field(:home_market, :id => "CF00NE0000005l33j")
  text_field(:verify_market_value, :id => "CF00NE0000004m6ol")
  text_field(:agency_name, :id => "CF00NE0000005UEs2")
  select_list(:closed_reason ,:id => '00NE0000000mhzR')
  select_list(:closed_reason_detail ,:id => '00NE0000005l33h')
  # subbu 08/04/2016 - element id changed
  #text_field(:sam, :id => "CF00N8A000000PWSu")   #:tabindex => "8")             ####:xpath => "//*[@value => 'opp3']/../../../following-sibling[8]/td[2]/div/span/input")
  text_field(:sam, :id => "CF00NE0000005mCkH")   #:tabindex => "8")             ####:xpath => "//*[@value => 'opp3']/../../../following-sibling[8]/td[2]/div/span/input")

  text_field(:template_description, :id =>"00NE0000005UEt4")

  link(:sam_lookup, :id => "CF00N23000000Hvo8_lkwgt")        #"//*[@value => 'opp3']/../../../following-sibling[8]/td[2]/div/span/a")
#  link(:sam_lookup, :css => "#CF00N23000000Hvo8_lkwgt > img:nth-child(1)")
  text_field(:probability, :id => "opp12")

  # subbu 08/04/2016 - element id changed
  #select_list(:order_type, :id => "00N23000000Kd4b")   #:tabindex => "9")     ####:xpath => "//*[@value => 'opp3']/../../../following-sibling[9]/td[2]/div/span/select")
  select_list(:order_type, :id => "00NE0000006L9at")   #:tabindex => "9")     ####:xpath => "//*[@value => 'opp3']/../../../following-sibling[9]/td[2]/div/span/select")
  select_list(:type,:id => 'opp5')
  div(:type_value, :id => 'opp5_ileinner')
  text_field(:amount_input, :id => "00NE0000004m6og")


  #checkbox(:research_review_checkbox, :tabindex => "10")
  select_list(:stage, :id => "opp11")
  div(:stage_value, :id => 'opp11_ileinner')
  text_field(:close_date, :id => "opp9")
  text_field(:start_date, :id => "00NE0000005kgsR")
  text_field(:end_date, :id => "00NE0000005kgsQ")
  link(:current_date_link, :tabindex => "12")    ####:xpath => "//*[@value => "opp9"]/following-sibling/a)
  #text_field(:reason_explanation, :tabindex => "15")
  #text_field(:competitor, :tabindex => "16")
  text_field(:agency, :xpath => "//*[@id='CF00NE0000005UEs2']")

####SAM Lookup Popup Window
  text_field(:search_field, :id => "lksrch")
  button(:go_button, :value => " Go! ")
  link(:first_contact_in_the_table, :href => "#")

####Buttons
  button(:save_button, :value => " Save ")
  button(:save_and_new_button, :value => "Save & New")
  button(:cancel_button, :value => "Cancel")

  #account look up

  link(:look_up_account, :xpath => "//*[@id='opp4_lkwgt']/img/..")
  in_frame(:id => "resultsFrame") do |frame|

    link(:account_name_lookup, :xpath => "html/body/div[1]/div[2]/div/div/div[2]/div/div[2]/table/tbody/tr[2]/th/a", :frame => frame)

  end
  #netsuite info
  checkbox(:paper_invoice, :id => "00NV00000010U7a")
  checkbox(:electronic_invoice, :id => "00NE0000005UEsW")
  text_field(:advertiser_billing_attention, :id => "00NE0000005UEs1")
  checkbox(:combined_revenue_invoice, :id => "00NE0000005UEsH")
  select_list(:co_op_type, :id => "00NE0000005UEsG")
  select_list(:invoice_copies, :id => "00NE0000005UEsl")
  div(:error_message, :id => "errorDiv_ep")
  div(:invoice_error_message, :xpath => "//*[@id='ep']/div[2]/div[9]/table/tbody/tr[6]/td[2]/div")
  checkbox(:notarize_invoice, :id => "00NE0000005UEsu")
  checkbox(:print_automatically, :id => "00NE0000005UEt8")
  div(:print_automatically_error_message, :xpath => "//*[@id='ep']/div[2]/div[11]/table/tbody/tr[5]/td[4]/div")
  checkbox(:advertiser_invoice, :id => "00NE0000005UEso")
  checkbox(:agency_invoice, :id => "00NE0000005UEsp")
  link(:agency_account, :xpath => "//*[@id='CF00NE0000005UEs2_lkwgt']/img/..")

  in_frame(:id => "resultsFrame") do |frame|
    link(:agency_link_select, :xpath => "//*[@id='Account_body']/table/tbody/tr[2]/th/a", :frame => frame)
  end


## marketing solution request

  button(:new_market_solutions, :value => "New Marketing Solutions Requests")


  ####Multiplatform
  text_field(:initial_budget_amount, :id => '00NE0000005WShn')

############# Local
  text_field(:gross_amount, :id => '00NV000000182Kn')

  div(:error_message, :id => "errorDiv_ep")



#------------Riaze
  text_field(:national_gross_amount,:id=>'00N44000006aveC')
  checkbox(:email_invoice,:id=>'00N0j000000HSCx')
  checkbox(:email_invoice_atl,:id=>'00N44000006b02x')
  checkbox(:paper_invoice,:id=>'00N0j000000HSCy')
  checkbox(:paper_invoice_atl,:id=>'00N44000006b02y')
  select_list(:special_request,:id=>'00NE0000005UEsn')


  # Name: form_field_order
  # Input: No input is needed.
  # Purpose: Fills the details of the various fields in required order

  def form_field_order
    %w{
        opportunity_name
        opp_description
        agency_or_direct
        industry
        sub_industry
        sam
        amount_input
        stage
        close_date
        start_date
        end_date
        agency
        initial_budget_amount
        type
        type_value
        stage_value
        population_type
        division
        mmp
        home_market
        closed_reason
        closed_reason_detail
        opp_description
        gross_amount
        national_gross_amount
}
  end

  # Name: data_class
  # Input:  No input is needed.
  # Purpose: Return the data class for the page

  def self.data_class
    SalesforceNewOpportunityEditPageData
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





