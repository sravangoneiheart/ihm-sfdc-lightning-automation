class SalesforceUserDetailPage < WebPage

  page_url(salesforce_environment_url)

  button(:edit_button, :name => 'edit')
  checkbox(:active_checkbox, :id => 'active')
  button(:save_button_permission, :id => "j_id0:j_id2:j_id3:j_id19:save")
  button(:save_button, :name => 'save')
  button(:save_button_role, :name => 'save')
  select_list(:role, :id => "role")

  button(:login_button, :name => "login")
  button(:edit_assignments, :value => "Edit Assignments")
  select_list(:avail_permission_set, :id => "j_id0:j_id2:j_id3:permSetAssignSection:pages:duelingListBox:backingList_a")
  image(:add_right, :id => "j_id0:j_id2:j_id3:permSetAssignSection:pages:duelingListBox:add")
  image(:remove_left, :id => "j_id0:j_id2:j_id3:permSetAssignSection:pages:duelingListBox:remove")
  select_list(:avail_permission_set_2, :id => "j_id0:j_id2:j_id3:permSetAssignSection:pages:duelingListBox:backingList_s")
  image(:remove, :id => "j_id0:j_id2:j_id3:permSetAssignSection:pages:duelingListBox:remove")
  link(:account_name_link_1, :link_text => 'LAN Smoke Advertiser')
  link(:preferred_viero_ae, :xpath => "html/body/div[1]/div[2]/table/tbody/tr/td[2]/div[4]/div[2]/div[2]/table/tbody/tr[44]/td[2]/a")
  cell(:preferred_ae, :xpath => "//*[@id='ep']/div[2]/div[2]/table/tbody/tr[44]/td[2]/a")
  select_list(:select_an_ae, :xpath => "html/body/div[1]/div/div/div/div[1]/div/div[2]/table/tbody/tr[2]/td/form/span[1]/select")
  span(:select_viero_ae, :value => "//*[@id='j_id0:j_id1:j_id2:j_id29:j_id30']/select/option[1]")
  span(:select_viero_ae_2, :value => "html/body/div[1]/div/div/div/div[1]/div/div[2]/table/tbody/tr[2]/td/form/span[2]/select")
  button(:save_ae, :xpath => "html/body/div[1]/div/div/div/div[1]/div/div[2]/table/tbody/tr[2]/td/form/span[1]/input")

  list_item(:ttwn_order_search, :id => "01rE0000000cEmo_Tab")

  link(:set_user_market, :xpath => "//*[@id='ep']/div[2]/div[8]/table/tbody/tr/td[2]/table/tbody/tr/td[1]/a")
  select_list(:home_financial_market, :xpath => "html/body/div[1]/div[2]/table/tbody/tr/td[2]/form/div[1]/div/div/div/div[2]/div/div[2]/table/tbody/tr[1]/td/div/span/select")
  select_list(:division_credit, :xpath => "html/body/div[1]/div[2]/table/tbody/tr/td[2]/form/div[1]/div/div/div/div[2]/div/div[2]/table/tbody/tr[2]/td/select")
  text_field(:home_operating_market, :xpath => "html/body/div[1]/div[2]/table/tbody/tr/td[2]/form/div[1]/div/div/div/div[2]/div/div[2]/table/tbody/tr[3]/td/div/span/input")
  button(:save_button, :name=> "j_id0:userMktForm:userMktBlock:j_id1:j_id2")
  cell(:home_operating_market_value, :xpath => "html/body/div[1]/div[2]/table/tbody/tr/td[2]/div[4]/div[2]/div[2]/table/tbody/tr[40]/td[2]")
  cell(:assigned_operating_markets_value, :xpath => "html/body/div[1]/div[2]/table/tbody/tr/td[2]/div[4]/div[2]/div[2]/table/tbody/tr[41]/td[2]")
  list_item(:opportunity_tab, :id => "Opportunity_Tab")







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
    SalesforceUserDetailPageData
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





