class SalesforceNewAccountPage < WebPage



  ##Lead-In Pages
    #New Account Sub-page
    select_list(:account_record_type, :id => "p3")
    button(:continue_button, :value => "Continue")
    button(:new_button, :value => " New ")
    #
    text_field(:account_name_search, :id => "pg:frm:txtAccountName")
    button(:more_button, :value => "More")
    checkbox(:do_not_call,:id=>'00NE0000005UXGZ')

    #
    button(:search_button, :value => "Search")
    button(:new_account_button, :value => "New Account")
    text_field(:account_name, :id =>"acc2")

    #
    link(:verify_address, :link_text => 'Verify Address')
    button(:accept_changes, :name => 'j_id0:j_id1:j_id28:j_id29:j_id31')
  ##The New Account Page
    #Buttons
      button(:save_button, :value => " Save ")
      button(:save_and_new_button, :value => "Save & New")
      button(:cancel_button, :value => "Cancel")
    #Account Information Section
      text_field(:account_name, :id => "acc2")        #required
      select_list(:industry, :id => "acc7")           #required
      select_list(:sub_industry, :id => "00NE0000004m6o7")
      select_list(:status, :id => "00NE0000000WmXK")  #required
      text_field(:phone, :id => "acc10")
      text_field(:fax, :id => "acc11")
    #TTWN Options
      text_field(:ttwn_advertiser_separation, :id => "00NE0000005mCk6")
      text_field(:advertiser_category_separation, :id => "00NE0000005mCjv")
      checkbox(:allow_invoice_estimates, :id => "00NE0000005mCjx")
      checkbox(:allow_invoice_buffer, :id => "00NE0000005mCjw")
    #Credit Information
      checkbox(:credit_approved, :id => "00NE0000005HDPT")
      select_list(:credit_status, :id => "00NE0000004m6ns")
      text_field(:credit_limit, :id => "00NE0000005HDPS")
      select_list(:credit_terms, :id => "00NE0000005HDPU")
      text_field(:credit_approval_date, :id => "00NE0000005O8sq")
      checkbox(:terms_accepted, :id => "00NE0000005HDPq")
      text_field(:accepted_by, :id => "00NE0000005O8ss")
      text_field(:accepted_date, :id => "00NE0000005O8so")
    #Account Classification
      select_list(:account_classification, :id => "00NE0000004m6np")
      select_list(:annual_ad_spend, :id => "00NE0000000WmX3")
      text_field(:next_year_potential, :id => "00NE0000000WmXG")
      text_field(:current_year_potential, :id => "00NE0000000WmX8")
    #Address Information
      select_list(:legal_country, :id => "acc18country")
      text_area(:legal_street, :id => "acc18street")
      text_field(:legal_city, :id => "acc18city")
      select_list(:legal_state_province, :id => "acc18state")
      text_field(:legal_zip_postal_code, :id => "acc18zip")
    #Description Information
      text_area(:description, :id => "acc20")
    #D&B Information
      text_field(:duns, :id => "00NE0000004m6nz")
    #credit enquiry
    button(:new_credit_inquiry, :value => "Create Credit Inquiry")
    list_item(:contact_tab, :id => "Contact_Tab")
    select_list(:agency_direct, :xpath => "00NE0000004m6Pz")
    text_field(:agency_info, :xpath => "//*[@id='CF00NE0000005UEs2']")

    #billing information
    checkbox(:electronic_invoice, :id => "00NE0000005UEqL")
    cell(:edi_partner_value, :id => "00NE0000005UEqK_ilecell")
    text_field(:edi_account_id, :id => "00N44000006BRXt")
    checkbox(:email_invoice, :id => "00N44000006BRXv")
    div(:error_message, :id => "errorDiv_ep")
    checkbox(:paper_invoice, :id => "00N44000006BRXy")
    select_list(:invoice_copies, :id => "00NE0000005UEqC")
    checkbox(:tax_exempt, :id => "00N44000006BRY5")
    checkbox(:combine_spot_non_spot, :id => "00N44000006BRXs")
    select_list(:co_op_type, :id => "00N44000006BRXq")
    checkbox(:supress_misc_rev_rate, :id => "00N44000006BRY3")
    checkbox(:supress_spot_rate, :id => "00N44000006BRY4")
    select_list(:billing_cycle, :id => "00N44000006BRXp")
    text_field(:discount, :id => "00NE0000005mCk0")
    checkbox(:notarize_invoice, :id => "00NE0000005UEqU")
    checkbox(:paper_invoice, :name => "00N44000006BRXy")
    checkbox(:supports_hd, :id => "00NE0000005UEqY")
    text_field(:ttwn_advertiser_separation_2, :id => "00NE0000005mCk6")
    checkbox(:paper_invoice_2, :id => "00N44000006BRXy")
    select_list(:edi_partner, :id => "00NE0000005UEqK")
    link(:invoice_special_help_text, :xpath => "//*[@id='Account.00NE0000005UEqS-_help']/img/..")
    text_field(:invoice_help_text, :xpath => "//*[@id='Account.00NE0000005UEqS-_help']/script/text()")



    #------------------Added by Riaze- start

    text_field(:discount,:id=>'00NE0000005mCk0')
    div(:account_error,:id=>'errorDiv_ep')
    text_field(:buyer_id,:id=>'00NE0000005mCjz')
    select_list(:invoice_special_request,:id=>'00NE0000005UEqS')
    select_list(:credit_type,:id=>'00NE0000005HDPV')
    text_field(:master_code,:id=>'00NE0000005HDPg')
    text_field(:active_division,:id=>'00NE0000006KSxA')
    text_field(:billing_email,:id=>'pageId:frmBilling:pageblockId:pageBlockSectionid:pageBlockSectionBillingEmailId:bmBillingEmail')
    text_field(:state_tax_id,:id=>'00NE0000005kgsC')
    text_field(:operative_id,:id=>'00N44000006BRXx')
    text_field(:parent_duns,:id=>'00NE0000005HDPm')
    checkbox(:suppress_misc_rev_rate,:id=>'00N44000006BRY3')
    checkbox(:suppress_spot_rate,:id=>'00N44000006BRY4')
    text_field(:website,:xpath=>'html/body/div[1]/div[2]/table/tbody/tr/td[2]/form/div/div[2]/div[3]/table/tbody/tr[13]/td[2]/input')
    text_field(:legal_name,:xpath=>'html/body/div[1]/div[2]/table/tbody/tr/td[2]/form/div/div[2]/div[3]/table/tbody/tr[3]/td[2]/input')

    in_frame(:id => "resultsFrame") do |frame|
      link(:parent_billing_account_1,:xpath=>"//*[@id='Account_body']/table/tbody/tr[3]/th/a", :frame => frame)
    end

    in_frame(:id => "resultsFrame") do |frame|
      link(:parent_billing_account_2,:xpath=>'html/body/div/div[2]/div/div/div[2]/div/div[2]/table/tbody/tr[4]/th/a', :frame => frame)
    end

    img(:parent_billing_search,:alt=>'Parent Billing Account Lookup (New Window)')
    checkbox(:impressions,:id=>'00N44000006BRXw')
    checkbox(:edi,:id=>'00NE0000005mCk5')
    text_field(:edi_idb,:id=>'00NE0000005UEqI')
    text_field(:agency_comm,:id=>'00N44000006BRXn')
    text_field(:parent_account,:id=>'acc3')
    select_list(:mastering_status,:id=>'00NE0000005HDPj')
    checkbox(:email_invoice,:id=>"00N44000006BRXv")
    select_list(:invoice_special_request,:id=>"00NE0000005UEqS")

    #------------------Added by Riaze- end





   # Name: form_field_order
  # Input: No input is needed.
  # Purpose: Fills the details of the various fields in required order

  def form_field_order
    %w{
        account_name
        legal_name
        industry
        sub_industry
        website
        legal_street
        legal_city
        legal_state_province
        legal_zip_postal_code
        agency_direct
        paper_invoice
        ttwn_advertiser_separation
        advertiser_category_separation
        edi_partner
        supports_hd
        allow_invoice_buffer
        allow_invoice_estimates
        buyer_id
        fax
        phone
        edi_partner
        notarize_invoice
        invoice_copies
        invoice_special_request
        credit_limit
        credit_type
        credit_status
        credit_approved
        master_code
        credit_terms
        state_tax_id
        co_op_type
        discount
        duns
        edi_account_id
        email_invoice
        operative_id
        parent_duns
        suppress_misc_rev_rate
        suppress_spot_rate
        tax_exempt
        agency_comm
        edi_idb
        edi
        impressions
    }
  end

  # Name: data_class
  # Input:  No input is needed.
  # Purpose: Return the data class for the page

  def self.data_class
    SalesforceNewAccountPageData
  end

  # Name: page_title_validation_value
  # Input: none
  # Purpose: return the validation value for the page title

  def self.page_title_validation_value
    #Subbu - 08/15/16 - changing values to accommodate new and edit page
    #/New Account/
    /Account/

  end

  # Name: page_url_validation_value
  # Input: none
  # Purpose: return the validation value for the page url

  def self.page_url_validation_value
    #Subbu - escape sequence not used for ?
    #/001\/e?retURL=/
    #/001\/e\?retURL=/
    #Subbu - 08/15/16 - changing values to accommodate new and edit page
    /\/e\?retURL=/

  end

end





