class SalesforceTTWNOrderLinePage < WebPage


  span(:order_number, :id => "j_id0:j_id11")

  button(:save_button, :value => "Save")
  button(:cancel_button, :value => "Cancel")

  #Subbu 08/05/2016 - Adding missing Elements
  #Header Buttons
  div(:edit_button, :id => "ActionsButton")
  button(:order_line_button, :value => "OrderLine")
  button(:flights_and_affiliates_button, :value => "Flight & Affiliates")
  button(:spot_distribution_button, :value => "Spot Distribution")

  button(:new_button, :name => "j_id0:form1:renderBlock:j_id48:j_id60")
  button(:delete_button, :name => "j_id0:form1:renderBlock:j_id48:j_id61")
  button(:duplicate_button, :name => "j_id0:form1:renderBlock:j_id48:j_id62")
  button(:refresh_r_and_i_button, :name => "j_id0:form1:renderBlock:j_id48:j_id63")

  2.upto 6 do |index|
    text_field("distribution_spots_#{index-1}", :xpath => "//*[@id='j_id0:form1:renderBlock:j_id126:SpotDistPanel']/table[2]/tbody/tr/td/table/tbody/tr[#{index}]/td[2]/table/tbody/tr/td[3]/input")
    #text_field("distribute_spots_#{index}", :name => "j_id0:form1:renderBlock:j_id126:j_id149:#{index}:j_id166")

  end

  #Subbu


  #Order Line Detail
  text_field(:market, :id => "j_id0:form1:pageBlock1:market")
  link(:market_lookup, :id => "j_id0:form1:pageBlock1:market_lkwgt")
    #Market Lookup Popup Window
    in_frame(:id => "resultsFrame") do |frame|
      link(:first_market_in_the_market_lookup_table, :class => " dataCell ", :frame => frame)
    end


  select_list(:inventory_group, :id => "j_id0:form1:pageBlock1:InvGroupSelect")
  select_list(:spot_type, :id => "j_id0:form1:pageBlock1:SpotType")
  text_field(:desired_spots, :id => "j_id0:form1:pageBlock1:desired")
  select_list(:distribution, :id => "j_id0:form1:pageBlock1:j_id70")

  #Flight Information
  text_field(:start_date, :id => "j_id0:form1:pageBlock1:startDate")
  text_field(:end_date, :id => "j_id0:form1:pageBlock1:endDate")

  select_list(:start_time_hour, :id => "j_id0:form1:pageBlock1:j_id86")
  select_list(:start_time_minute, :id => "j_id0:form1:pageBlock1:j_id90")
  select_list(:start_time_am_pm, :id => "j_id0:form1:pageBlock1:j_id92")
  select_list(:end_time_hour, :id => "j_id0:form1:pageBlock1:selectStartAMPM")
  select_list(:end_time_minute, :id => "j_id0:form1:pageBlock1:j_id98")
  select_list(:end_time_am_pm, :id => "j_id0:form1:pageBlock1:j_id100")
  text_field(:weeks_on, :id => "j_id0:form1:pageBlock1:weekon")
  text_field(:weeks_off, :id => "j_id0:form1:pageBlock1:weekoff")

  #Rates
  text_field(:override_rate, :id => "j_id0:form1:pageBlock1:rate")

  #Additional Details
    #Tabs
    cell(:networks_tab, :id => "j_id0:form1:pageBlock1:Networks_lbl")
    cell(:services_tab, :id => "j_id0:form1:pageBlock1:Services_lbl")
    cell(:formats_tab, :id => "j_id0:form1:pageBlock1:Formats_lbl")
    cell(:controversial_programing_tab, :id => "j_id0:form1:pageBlock1:Programming_lbl")
    #Networks Tab
    checkbox(:reach_maximizer, :id => "j_id0:form1:pageBlock1:NetWorks2")
    checkbox(:total_reach_premium, :id => "j_id0:form1:pageBlock1:NetWorks2")
    #Services Tab
    checkbox(:all_services_included, :id => "j_id0:form1:pageBlock1:services3")
    checkbox(:check_uncheck_all_10s, :id => "j_id0:form1:pageBlock1:services5")
    checkbox(:check_uncheck_all_15s, :id => "j_id0:form1:pageBlock1:services5")
    table(:included_services_table, :xpath => "//*[@id='j_id0:form1:pageBlock1:Services']/table/tbody/tr/td/table/tbody/tr/td[1]/table")
      checkbox(:local_news_10_sec, :name => "j_id0:form1:pageBlock1:j_id136:0:j_id142")
      checkbox(:local_news_15_sec, :name => "j_id0:form1:pageBlock1:j_id136:0:j_id146")
      checkbox(:metro_source_news_10_sec, :name => "j_id0:form1:pageBlock1:j_id136:1:j_id142")
      checkbox(:metro_source_news_15_sec, :name => "j_id0:form1:pageBlock1:j_id136:1:j_id146")
      checkbox(:network_local_traffic_10_sec, :name => "j_id0:form1:pageBlock1:j_id136:2:j_id142")
      checkbox(:network_local_traffic_15_sec, :name => "j_id0:form1:pageBlock1:j_id136:2:j_id146")
      checkbox(:reach_10_sec, :name => "j_id0:form1:pageBlock1:j_id136:3:j_id142")
      checkbox(:reach_15_sec, :name => "j_id0:form1:pageBlock1:j_id136:3:j_id146")
      checkbox(:sports_10_sec, :name => "j_id0:form1:pageBlock1:j_id136:4:j_id142")
      checkbox(:sports_15_sec, :name => "j_id0:form1:pageBlock1:j_id136:4:j_id146")
      checkbox(:traffic_10_sec, :name => "j_id0:form1:pageBlock1:j_id136:5:j_id142")
      checkbox(:traffic_15_sec, :name => "j_id0:form1:pageBlock1:j_id136:5:j_id146")
      checkbox(:weather_10_sec, :name => "j_id0:form1:pageBlock1:j_id136:6:j_id142")
      checkbox(:weather_15_sec, :name => "j_id0:form1:pageBlock1:j_id136:6:j_id146")
    #Formats Tab
    checkbox(:all_formats_included, :id => "j_id0:form1:pageBlock1:Formats3")
    table(:formats_table, :xpath => "//*[@id='j_id0:form1:pageBlock1:Formats']/table/tbody/tr/td/table/tbody/tr/td[1]/table")

      #Other Market Formats Checkboxes
      checkbox(:adult_contemporary, :value => "Adult Contemporary")
      checkbox(:adult_hits, :id => "Adult Hits")
      checkbox(:chr, :value => "CHR")
      checkbox(:classic_rock, :value => "Classic Rock")
      checkbox(:country, :value => "Country")
      checkbox(:hot_ac, :value => "Hot AC")
      checkbox(:hot_sports_talk, :value => "Hot/Sports Talk")
      checkbox(:jazz_classical, :value => "Jazz/Classical")
      checkbox(:new_rock, :value => "New Rock")
      checkbox(:news_talk, :value => "News/Talk")
      checkbox(:nostalgia, :value => "Nostalgia")
      checkbox(:od, :value => "O.D")
      checkbox(:oldies, :value => "Oldies")
      checkbox(:other_formats, :value => "Other")
      checkbox(:religious, :value => "Religious")
      checkbox(:rhythmic, :value => "Rhythmic")
      checkbox(:rock, :value => "Rock")
      checkbox(:spanish, :value => "Spanish")
      checkbox(:tv, :value => "TV")
      checkbox(:urban, :value => "Urban")
      checkbox(:urban_no_rap, :value => "Urban No Rap")
    #Controversial Programming Tab
      select_list(:included_controversial_program, :id => "j_id0:form1:pageBlock1:controversial")
      select_list(:excluded_controversial_program, :id => "j_id0:form1:pageBlock1:controversial2")
      image(:add_to_excluded, :class => "rightArrowIcon")
      image(:remove_from_excluded, :class => "leftArrowIcon")
      checkbox(:all_programs_excluded, :id => "j_id0:form1:pageBlock1:exclude")



  # Name: form_field_order
  # Input: No input is needed.
  # Purpose: Fills the details of the various fields in required order

  def form_field_order
    %w{
        market
        start_date
        desired_spots
    }
  end

  # Name: data_class
  # Input:  No input is needed.
  # Purpose: Return the data class for the page

  def self.data_class
    SalesforceTTWNOrderLinePageData
  end

  # Name: page_title_validation_value
  # Input: none
  # Purpose: return the validation value for the page title

  def self.page_title_validation_value
    /SPONSORSHIP ORDER AGREEMENT - ORDER LINES/
  end

  # Name: page_url_validation_value
  # Input: none
  # Purpose: return the validation value for the page url

  def self.page_url_validation_value
    /TTNOrderLineEdit?/
  end

end





