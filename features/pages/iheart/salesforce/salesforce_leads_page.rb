class SalesforceLeadsPage < WebPage

  #leads page account lightning
  list_item(:new_lead, :xpath => "//*[@id='brandBand_1']/div/div/div[2]/div/div/div[1]/div[1]/div[2]/ul/li[1]")



  text_field(:last_name, :class => "compoundBLRadius compoundBRRadius form-element__row input")
  text_field(:first_name, :class => "compoundBorderBottom form-element__row input")
  text_field(:company, :class => " input")
  text_field(:company, :xpath => "html/body/div[5]/div[2]/div[3]/div[2]/div/div[2]/div/div[4]/div/div[1]/div/div/div[3]/div[1]/div/div/div/input")
  select_list(:lead_source, :xpath => "html/body/div[5]/div[2]/div[3]/div[2]/div/div[2]/div/div[4]/div/div[4]/div/div/div[1]/div[1]/div/div/div/div/div[1]/div/div/a")
  select_list(:lead_source_type, :xpath => "html/body/div[5]/div[2]/div[3]/div[2]/div/div[2]/div/div[4]/div/div[4]/div/div/div[2]/div[1]/div/div/div/div/div[1]/div/div/a")


  text_area(:street, :class => "compoundTLRadius compoundTRRadius compoundBorderBottom textarea")
  text_field(:city, :class => "compoundBorderRight compoundBorderBottom input")
  text_field(:zip_code, :class => "compoundBLRadius compoundBorderRight input")
  select_list(:state, :class => "select")
  button(:save_button, :class => "slds-button slds-button--neutral uiButton--default uiButton--brand uiButton forceActionButton")





  ##create task
  button(:new_task, :value => "New Task")
  text_field(:task_subject, :id => "tsk5")
  text_field(:task_due_date, :id => "tsk4")
  select_list(:task_activity_type, :id => "00NE0000004m6oD")
  select_list(:status, :id => "tsk12")




  link(:close_open_activity, :xpath => "html/body/div[1]/div[2]/table/tbody/tr/td[2]/div[6]/div[1]/div/div[2]/table/tbody/tr[2]/td[1]/a[2]")
  button(:more_button, :value => "More")
  button(:candidate_search_button, :xpath => "//*[@id='pg:frm:j_id65:j_id66']/input[1]")
  button(:new_account_button, :value => "New Account")
  link(:opportunity_link, :xpath => "html/body/div[1]/div[2]/table/tbody/tr/td[2]/div[7]/div[1]/div/div[2]/table/tbody/tr[2]/th/a")


  button(:convert_lead, :xpath => "//*[@id='topButtonRow']//input[@value='Convert Lead']")
  select_list(:account_name_attach, :id => "accid")
  link(:look_up_account, :xpath => "//*[@id='acclkid_lkwgt']/img/..")
  link(:recent_link, :xpath => "//*[@id='bodyCell']/div[3]/div[1]/div/div[2]/table/tbody/tr[2]/th/a")
  select_list(:contact_name, :id => "conid")
  button(:convert,:xpath=>"//div[@class='pbHeader']//input[@value='Convert']")

 # link(:account_name_lookup, :xpath => '//*[contains(text(), "TestAcc20161207121124")]')

  # link(:account_name_lookup, :xpath => ".//*[@id='Account_body']/table/tbody/tr[2]/th/a")
  # link(:account_name_lookup, :link_text => "TestAcc20161207121124")
#   in_iframe(:id => "066E0000001H0lS") do |inner_frame|
#       0.upto 2 do |index|
#       span(:"gross_costs_#{index+1}", :xpath => "//*[@id='rfSchedRelLst:frm:j_id4:j_id10:#{index}:grossRevText']", :frame => inner_frame)
#    end
# end

  in_frame(:id => "resultsFrame") do |frame|

   link(:account_name_lookup, :xpath => "//*[@id='Account_body']/table/tbody/tr[2]/th/a", :frame => frame)

  end

  in_frame(:id => "resultsFrame") do |frame|

    link(:account_name_lookup_adve, :xpath => "//*[@id='Account_body']/table/tbody/tr[3]/th/a", :frame => frame)

  end


  in_frame(:id => "searchFrame") do |frame|

    text_field(:search_name_lookup, :xpath => ".//*[@id='lksrch']", :frame => frame)

  end
  #//*[contains(text(), "TestAcc20161207121124")]
  in_frame(:id => "searchFrame") do |frame|

    text_field(:go_button, :xpath => ".//*[@id='theForm']/div/div[2]/input[2]", :frame => frame)

  end

text_field(:subject, :id => "tsk5_fu")
  text_field(:due_date, :id => "tsk4_fu")
  button(:convert_button, :value => "Convert")
  button(:convert_cancel_button, :xpath => "//*[@id='topButtonRow']/input[2]")
  select_list(:account_name, :id => "accid")
  select_list(:activity_type, :id => "00NE0000004m6oD_fu")
  button(:attach_file, :value => "Attach File")
  button(:choose_file_button, :id => "file")
  button(:done_button, :value => " Done ")
  button(:more_button, :value => "More")
  button(:candidate_search_button, :xpath => " //*[@id='pg:frm:j_id71:j_id72']/input[1]")
  button(:new_account_button, :value => "New Account")
  text_field(:account_subject, :id => "j_id0:theForm:pageBlock:j_id41:j_id42:j_id44:j_id45:taskSubject")
  text_field(:account_due_date, :id => "j_id0:theForm:pageBlock:j_id41:j_id42:j_id44:j_id52:taskDueDate")
  button(:mass_edit,:value=>'Mass Edit')
  checkbox(:first_check_box,:xpath=>"//*[@id='ext-gen25']/div[1]/table/tbody/tr[1]/td[1]/div/input")
  checkbox(:second_check_box,:xpath=>"//*[@id='ext-gen25']/div[2]/table/tbody/tr[1]/td[1]/div/input")
  checkbox(:mass_edit_select_all,:id=>'selectAll')
  select_list(:mass_edit_first_lead_disposition,:id=>"pageMassEdit:frmMassEditLead:mainPageBlock:leadTable:0:j_id63")
  select_list(:mass_edit_second_lead_disposition,:id=>"pageMassEdit:frmMassEditLead:mainPageBlock:leadTable:1:j_id63")
  select_list(:view_my_accounts, :id => "fcf")
  button(:go,:value=>' Go! ')
  div(:mass_edit_message,:id=>'pageMassEdit:frmMassEditLead:mainPageBlock:j_id8:j_id9:j_id10:0:j_id11:j_id12:j_id14')
  select_list(:mass_edit_first_status,:id=>'pageMassEdit:frmMassEditLead:mainPageBlock:leadTable:0:j_id61')
  select_list(:mass_edit_second_status,:id=>'pageMassEdit:frmMassEditLead:mainPageBlock:leadTable:1:j_id61')
  button(:return,:value=>'Return')
  span(:first_mass_edit_lead,:xpath=>"//*[@id='ext-gen25']/div[1]/table/tbody/tr[1]/td[4]/div/a/span")
  span(:second_mass_edit_lead,:xpath=>"//*[@id='ext-gen25']/div[2]/table/tbody/tr[1]/td[4]/div/a/span")
  div(:lead_deposition,:id=>'00NE0000005lbn1_ileinner')
  select_list(:lead_country,:id=>'lea16country')
  text_field(:lead_street,:id=>'lea16street')
  text_field(:lead_city,:id=>'lea16city')
  select_list(:lead_state,:id=>'lea16state')
  text_field(:lead_zip,:id=>'lea16zip')
  div(:leads_error_message,:id=>'errorDiv_ep')
  link(:request_access_1,:xpath=>"//*[@id='pg:frm:resultBlock:j_id81:0:j_id82']/a")
  link(:convert_lead_1,:xpath=>"//*[@id='pg:frm:resultBlock:j_id81:0:j_id82']/a")
  link(:verify_address_link, :link_text => "Verify Address")
  button(:accept_changes_button, :value => "Accept changes")








  def form_field_order
    %w{
    last_name
    company
    lead_source
    industry
    sub_industry
    advertiser_or_agency
    task_subject
    task_due_date
    task_activity_type
    status
    street
    city
    zip_code
    state
    Website
    yelp
    facebook
    google
    webana
    }
  end

  # Name: data_class
  # Input:  No input is needed.
  # Purpose: Return the data class for the page

  def self.data_class
    SalesforceLeadsPageData
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
