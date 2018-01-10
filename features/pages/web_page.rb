include DataHelper

class WebPage
  include PageObject
  include PageHelper

  # web_page.rb can be used to record all page elements that can be referenced throughout the hierarchy such as header/footer/navigational text/buttons/etc.
  # Consider this the "base page" in which to include all common elements of your web hierarchy

  # HEADER - Define header/navigation bar items that will be on every subsequent page

####SEARCH ELEMENTS
  text_field(:search_field, :id => "phSearchInput")
  button(:search_button, :id => "phSearchButton")

  #researchtool
  button(:launch_research_tools, :xpath => "//*[@id='j_id0:j_id2:j_id4:j_id34:bottom']/input")

  #sravan netsuite tab
  div(:app_switch_dropdown, :id => "tsidButton")
  link(:unity, :xpath => "//*[@id='tsid-menuItems']/a[21]")

####UPPER RIGHT HEADER ELEMENTS
  div(:username_menu_dropdown, :id => "userNavButton")
  # Subbu 08/05/2016 - Not identifying partial link for href
      #link(:my_profile_link, :href => "/_ui/core/userprofile/UserProfilePage")
      link(:my_profile_link, :text => "My Profile")
  #Subbu
      link(:setup_link, :title => "Setup")
  # Subbu 08/05/2016 - Not identifying partial link for href
     # link(:logout_link, :href => "/secur/logout.jsp")
     link(:logout_link, :text => "Logout")
  #Subbu
  link(:help_and_training_link, :class => "brandZeronaryFgr")
  div(:app_switch_dropdown, :id => "tsidButton")


 button(:new_button, :value => " New ")
####TABS IN SALESFORCE HEADER
  list_item(:home_tab, :id => "home_Tab")
  list_item(:chatter_tab, :id => "Chatter_Tab")
  list_item(:accounts_tab, :xpath => "html/body/div[5]/div[1]/header/div[3]/one-appnav/div/one-app-nav-bar/nav/ul/li[3]")
  list_item(:contacts_tab, :id => "Contact_Tab")
  list_item(:opportunities_tab, :id => "Opportunity_Tab")
  list_item(:reports_tab, :id => "report_Tab")
  list_item(:dashboards_tab, :id => "Dashboard_Tab")
  list_item(:leads_tab, :id => "Lead_Tab")
  list_item(:ttwn_order_search_tab, :class => "wt-TTWN-Order-Search")
  list_item(:ttwn_orders_tab, :class => "wt-TTWN-Order-Search")
  list_item(:ttwn_mods_tab, :class => "wt-OEF_Mod")
  list_item(:vit_proposals_tab, :class => "wt-vit_Proposal")
  list_item(:all_tabs_tab, :id => "AllTab_Tab")
  link(:research_tools_tab, :id =>"01rE00000001y9M_Tab")
  list_item(:proposal_tab, :id => "01rE00000001y9T_Tab")
  link(:account_export, :xpath => "//*[@id='bodyCell']/div[3]/div[2]/table/tbody/tr[1]/td[1]/a")
  link(:account_market, :xpath => "//*[@id='j_id0:j_id4:j_id31:j_id36']/div/table/tbody/tr/td[1]/select/option[28]")

  link(:recent_proposal, :xpath => "html/body/div[1]/div[2]/table/tbody/tr/td[2]/div[3]/div[1]/div/div[2]/table/tbody/tr[2]/th/a")

  link(:opportunity_approval_link, :xpath => "html/body/div[3]/div[2]/table/tbody/tr/td[2]/div[1]/div[3]/div/div/div[1]/div[2]/div[2]/div/div[5]/div/div[1]/div[1]/div[1]/span/span[1]/a")

  link(:activities_tab, :xpath => "//li[@id = 'Lead_Tab']/following-sibling[1]/a")                #:title => "Activities Tab")
  link(:broadcast_proposal_tab, :xpath => "//li[@id = 'Lead_Tab']/following-sibling[2]/a")     #:title => "Broadcast Proposal Tab")

  link(:recent_opportunity, :xpath => "html/body/div[1]/div[2]/table/tbody/tr/td[2]/div[3]/div[1]/div/div[2]/table/tbody/tr[2]/th/a")

  button(:new_proposal_button, :value=>"New Proposal")
  link(:recent_account, :xpath => "html/body/div[1]/div[2]/table/tbody/tr/td[2]/div[3]/div[1]/div/div[2]/table/tbody/tr[2]/th/a")


  link(:approve_opportunity_page, :xpath => "html/body/div[3]/div[2]/table/tbody/tr/td[2]/div[1]/div[3]/div/div/div[1]/div[2]/div[2]/div/div[5]/div/div[1]/div[1]/div[1]/span/span[1]/a")
  link(:approve_reject, :id=> "j_id0:approverForm:mainBlock:j_id4:j_id7")
  button(:approve_button, :value => "Approve")
  button(:ok_button, :value => "OK")
  button(:edit_button, :value => " Edit ")
  checkbox(:activate_checkbox, :id => "active")
  button(:save_button, :value => " Save ")
  text_field(:account_name_field, :id => "j_id0:j_id4:j_id31:j_id35:lstAccounts")
  select_list(:market_data, :name => "j_id0:j_id4:j_id31:j_id36:j_id37")
  div(:user_navigation_button, :xpath => "//*[@id='userNavButton']")
  link(:logout_button, :xpath =>"//*[@id='userNav-menuItems']/a[4]")
  link(:account_number, :xpath => './/*[@id="Account_body"]/table/tbody/tr[2]/th/a')
  button(:search_again, :id => 'secondSearchButton')
  link(:developer_console,:link_text=>'Developer Console')
  div(:search_warning_message,:id=>'searchResultsWarningMessageBox')


####LEFT SIDE "PULL OUT" MENU
  link(:left_side_menu_display_tab, :id => "pinIndicator")

  # link(:home_tab, :href => "/home/home.jsp")
  # link(:chatter_tab, :href => "/_ui/core/chatter/ui/ChatterPage")
  # link(:accounts_tab, :href => "/001/o")
  # link(:contacts_tab, :href => "/003/o")
  # link(:opportunities_tab, :href => "/006/o")
  # link(:reports_tab, :href => "/00O/o")
  # link(:dashboards_tab, :href => "/01Z/o")
  # link(:leads_tab, :href => "/00Q/o")
  # link(:activities_tab, :title => "Activities Tab")
  # link(:broadcast_proposal_tab, :title => "Broadcast Proposal Tab")
  # link(:all_tabs_tab, :class => "allTabsArrow")


  # FOOTER - Define footer universal footer items



  # Name: page_title_is_correct
  # Input: No input is needed.
  # Purpose: Checks whether the page title is correct or not

  def page_title_is_correct

    ( text =~ self.class.page_title_validation_value ) !=nil
  end

  # Name: page_url_is_correct
  # Input: No input needed.
  # Purpose: Checks whether the page url is correct or not

  def page_url_is_correct
    ( current_url =~ self.class.page_url_validation_value ) !=nil
  end

  # Name: instantiate_page_data_object
  # Input: String (e.g.- default data)
  # Purpose: To set up an instance of page data object

  def instantiate_page_data_object(data_key = self.class.data_class.default_data)
    @fillable_form_fields = form_field_order()
    @current_page_data_object = self.class.data_class.new(data_key)
  end

  # Name: instantiate_page_data_object_using_partial_keys
  # Input: String containing partial keys
  # Purpose: To set up an instance of page data object

  def instantiate_page_data_object_using_partial_keys(partial_keys, number = nil, fixed_field_offsets = [])
    @fillable_form_fields = form_field_order()
    @current_page_data_object = self.class.data_class.new(partial_keys, number, fixed_field_offsets)
  end

  # Name: fill_all_form_data
  # Input: No input is needed.
  # Purpose: It fills all the required data fields of the form

  def fill_all_form_data()
    if verbose_messages
      p @fillable_form_fields
      p @current_page_data_object
    end
    @fillable_form_fields.each do |field|
      value = @current_page_data_object.retrieve_data_for(field)

      enter_element_value(field, value) if value and (value != "nil")
    end
  end

  # Name: enter_element_value
  # Input: String (e.g.- field), Int (e.g.- the value to enter)
  # Purpose: It enters a value to a field

  def enter_element_value(original_field, value)
    field = original_field.downcase.gsub(" ", "_")
    unless self.respond_to? field + "_element"
      warn "undefined method '#{field + '_element'}' for #{@current_page.class}"
      return
    end

    field_type = self.send(field + "_element").class.to_s

    if verbose_messages
      p field_type
      p field
      p value
    end

    if value.class.to_s == "Array"
      value = eval(value[0]).call(:param_string => value[1], :current_page => self, :repeatable_field_index => value[2])
    end

    if value =~ /^lambda/
      value = eval(value).call(:current_page => self)
    end

    formatted_value = value.to_s.downcase.gsub(" ", "_")

    p value if verbose_messages

    return if value.nil? or (value == "nil")

    keep_trying_to_set(1) do
     case field_type
        when /select/i
          Watir::Wait.until(10) {self.send(field + "_element").exists?}
          return if self.send(field.downcase.gsub(" ", "_")) == value and value != "Please Select"
          self.send(field + "=", value)
        when /text/i
          Watir::Wait.until(10) {self.send(field + "_element").exists?}
          return if self.send(field) == value and value != ""
          self.send(field + "=", value)
          self.send(field + "_element").send_keys(:tab)
        when /checkbox/i
          Watir::Wait.until(10) {self.send(field + "_element").exists?}
          #value should be: "check" or "uncheck"
          self.send(value.downcase + "_" + field)
        when /radio/i
          Watir::Wait.until(10) { self.send( field + "_" + formatted_value + "_element" ).exists? }
          self.send( "select_" + field + "_" + formatted_value )
        when /label/i
          if value =~ /check/
            if (value == "check" and not self.send( field + "_element" ).element.parent.checkbox.checked?) or
                (value == "uncheck" and self.send( field + "_element" ).element.parent.checkbox.checked?)
              self.send( field + "_element" ).click
            end
          else #radio button
            if ENV['browser_type'] == 'ie'
              self.send(field + "_" + formatted_value + "_element").click
            else
              self.send(field + "_" + formatted_value + "_element").focus
              self.send(field + "_" + formatted_value + "_element").fire_event "onclick"
            end
          end
        #subbu 08/31 - Added functionality for couple of tags - button and div
        when /span|button|div/i
          self.send( field + "_element" ).click
        else
          raise("Unknown field type:" + field_type)
      end
    end
  end

  def get_select_list_options(select_list_name, ignore = "")
    self.send("#{select_list_name}_element").options.to_a.select {|option| option.text !~ /^(#{ignore})/i}
  end

  def radio_list_for_group(radio_label_name)
    self.send(radio_label_name.gsub(" ","_").downcase + "_element").parent.radios
  end

  def labels_from_radio_group(radio_label_name)
    p radio_label_name
    p self.send(radio_label_name.gsub(" ","_").downcase + "_element").parent.lis
    self.send(radio_label_name.gsub(" ","_").downcase + "_element").parent.lis.each{|r| p r.text}
    self.send(radio_label_name.gsub(" ","_").downcase + "_element").parent.lis.map{ |list_item| list_item.text}
  end

  # Name: verify_checkbox_status
  # Input: String (name of checkbox), String (status of the checkbox e.g. - checked)
  # Purpose: It waits until the following message: "Please wait while we are processing your request".

  def verify_checkbox_status(name, status)
    case status.upcase
      when "CHECKED"
        send("#{name}_element").parent.element.checkbox.checked?
      when "UNCHECKED"
        not send("#{name}_element").parent.element.checkbox.checked?
      when "DISABLED"
        send("#{name}_element").parent.element.checkbox.disabled?
      when "ENABLED"
        send("#{name}_element").parent.element.checkbox.enabled?
    end
  end

  # Name: verify_element_status
  # Input: String (name of element), String (status of the element e.g. - disabled)
  # Purpose: verify if an element is disabled or enabled

  def verify_element_status(name, status)
    case status.upcase
      when "DISABLED"
        send("#{name}_element").disabled?
      when "ENABLED"
        send("#{name}_element").enabled?
      when "NOT PRESENT"
       !(send("#{name}_element").exists?)
      when "PRESENT"
        send("#{name}_element").exists?
    end
  end

  def file_upload(file_path)
    wsh = WIN32OLE.new('Wscript.Shell')
    sleep 1
    wsh.SendKeys("#{file_path}")
    sleep 1
    wsh.SendKeys "~"
  end

  def retrieve_data_for_value(field)
    value=@current_page_data_object.retrieve_data_for(field)
  end
end