class SalesforceNewProposalPage < WebPage

text_field(:proposal_name, :id => 'Name')
text_field(:user_name, :id => 'CF00NE0000005UF0c')
button(:save_button, :name => 'save')
button(:proposal_lines_button, :name => 'edit_proposal_lines')
button(:proposal_output, :value => "Proposal Output" )

text_field(:opportunity_field, :id => "CF00NE0000005UEpz")

# radio_button(:streaming_radio_button, :id => "rdoStreaming")
# radio_button(:digital_radio_button, :id => "rdoDigital")
# radio_button(:miscellaneous_radio_button, :id => "rdoMiscellaneous")
# radio_button(:broadcast_radio_button, :id =>'rdoBroadcast')

  radio_button(:streaming_radio_button, :id => "rdoStreaming")
  radio_button(:digital_radio_button, :xpath => 'html/body/div[2]/span[21]/div/div[2]/table/tbody/tr/td[4]/label[3]/input')
  radio_button(:miscellaneous_radio_button, :xpath =>"//*[@id='rdoMiscellaneous']")
  radio_button(:broadcast_radio_button, :id =>'rdoBroadcast')


#rates ad values
  span(:cost_comm_lines_value , :xpath => "//*[@id='costCommLines']/span")
  span(:cost_lines_with_values, :xpath => "//*[@id='costLinesWithTR']/span")
  span(:tr_cost_lines_with_values, :id => "trCostLinesWithTR")
  span(:target_rate_index_values, :id => "targetRateIndex")
  span(:total_commission_values, :xpath => "//*[@id='costCommLines']/span")
  span(:tr_total_commission_values, :id => "totalCommissionTR")
  span(:total_spots_values, :id => "revSummaryTotalSpots")
  span(:total_weeks_values, :id => "revSummaryTotalWks")
  span(:spot_revenue_values, :id => "revSummarySpotRev")
  span(:digital_revenue_values, :id => "revSummaryDigitalRev")
  span(:misc_revenue_values, :id => "revSummaryMiscRev")
  span(:total_revenue_values, :id => "revSummaryTotRev")
  div(:pitch_rate, :id => "ai_pitchRateWithMarkup")
  div(:target_rate, :id => "ai_targetRateWithMarkup")
  div(:target_rate_cost, :id => "ai_targetRateCost")
  div(:target_rate_met, :id => "ai_targetRateMet")
  div(:target_rate_diff, :id => "ai_targetRateDiff")
  div(:target_rate_index, :id => "ai_targetRateIndex")
  div(:br_ach, :id => "ai_brAchievement")
  div(:total_inventory, :id => "ai_inventoryAllowedSeconds")
  div(:available_inventory, :id => "ai_inventoryAvailableSeconds")
  div(:req_inventory, :id => "ai_requestedInventory")
  div(:gi, :id => "ai_gi")
  div(:cpm, :id => "ai_cpm")
  div(:grp, :id => "ai_grpPerct")
  div(:cume_rtg, :id => "ai_cumeRtg")
  div(:net_reach, :id => "ai_reach")
  div(:cume, :id => "ai_cume")
  div(:pre_tri_comm, :id => "ai_commPreTriPercent")
  div(:net_comm, :id => "ai_commNetPercent")
  div(:comm, :id => "ai_commDollar")
  div(:comm_if_tr, :id => "ai_commDollarAtTr")
  div(:comm_diff_if_sold, :id => "ai_commDollarDiffSoldAtTr")
  div(:ordered_cpm, :id => "ai_orderedCPM")
 div(:cpm_target_rate, :id => "ai_cpmTargetRate")
  div(:cpm_pitch_rate, :id => "ai_cpmPitchRate")
  div(:digital_target_rate_cost, :id => "ai_targetRateCost_dig")
  div(:pitch_rate_cost, :id => "ai_pitchRateCost")
  div(:digital_br_ach, :id => "ai_brAchievement_dig")
  div(:target_cost_diff, :id => "ai_targetRateDiff_dig")
  div(:dig_target_rate_index, :id => "ai_targetRateIndex_dig")
  div(:dig_total_inventory, :id => "ai_totalInventory_dig")

link(:commissions_and_totals, :xpath => "html/body/div[2]/span[21]/div/div[2]/div/div/div/div/ul/li[2]/a")
  link(:station_totals, :xpath => "html/body/div[2]/span[21]/div/div[2]/div/div/div/div/ul/li[3]/a")
  radio_button(:streaming_stations, :id => "rdoStationTotalsStreaming")
  radio_button(:broadcast_stations, :id => "rdoStationTotalsBroadcast")

  ##station totals values
  cell(:station_station, :xpath => "//*[@id='stationTotalsGrid']/div[2]/table/tbody/tr/td")
  cell(:start_date_station, :xpath => "html/body/div[2]/span[21]/div/div[2]/div/div/div/div/div[3]/span/div/div/div[3]/table/tbody/tr/td[1]")
  cell(:end_date_station, :xpath => "html/body/div[2]/span[21]/div/div[2]/div/div/div/div/div[3]/span/div/div/div[3]/table/tbody/tr/td[2]")
  cell(:weeks_station, :xpath => "html/body/div[2]/span[21]/div/div[2]/div/div/div/div/div[3]/span/div/div/div[3]/table/tbody/tr/td[3]")
  cell(:rate_station, :xpath => "html/body/div[2]/span[21]/div/div[2]/div/div/div/div/div[3]/span/div/div/div[3]/table/tbody/tr/td[4]")
  cell(:cost_station, :xpath => "html/body/div[2]/span[21]/div/div[2]/div/div/div/div/div[3]/span/div/div/div[3]/table/tbody/tr/td[5]")
  cell(:total_spots_station, :xpath => "html/body/div[2]/span[21]/div/div[2]/div/div/div/div/div[3]/span/div/div/div[3]/table/tbody/tr/td[6]")
  cell(:target_rate_station, :xpath => "html/body/div[2]/span[21]/div/div[2]/div/div/div/div/div[3]/span/div/div/div[3]/table/tbody/tr/td[7]")
  cell(:target_rate_cost_station, :xpath => "html/body/div[2]/span[21]/div/div[2]/div/div/div/div/div[3]/span/div/div/div[3]/table/tbody/tr/td[8]")
  cell(:target_rate_diff_station, :xpath => "html/body/div[2]/span[21]/div/div[2]/div/div/div/div/div[3]/span/div/div/div[3]/table/tbody/tr/td[9]")
  cell(:target_rate_index_station, :xpath => "html/body/div[2]/span[21]/div/div[2]/div/div/div/div/div[3]/span/div/div/div[3]/table/tbody/tr/td[10]")
  cell(:br_ach_station, :xpath => "html/body/div[2]/span[21]/div/div[2]/div/div/div/div/div[3]/span/div/div/div[3]/table/tbody/tr/td[11]")
  cell(:aqh_station, :xpath => "html/body/div[2]/span[21]/div/div[2]/div/div/div/div/div[3]/span/div/div/div[3]/table/tbody/tr/td[12]")
  cell(:aqh_rtg_station, :xpath => "html/body/div[2]/span[21]/div/div[2]/div/div/div/div/div[3]/span/div/div/div[3]/table/tbody/tr/td[13]")
  cell(:cpm_station, :xpath => "html/body/div[2]/span[21]/div/div[2]/div/div/div/div/div[3]/span/div/div/div[3]/table/tbody/tr/td[14]")
  cell(:cpp_station, :xpath => "html/body/div[2]/span[21]/div/div[2]/div/div/div/div/div[3]/span/div/div/div[3]/table/tbody/tr/td[15]")
  cell(:gi_station, :xpath => "html/body/div[2]/span[21]/div/div[2]/div/div/div/div/div[3]/span/div/div/div[3]/table/tbody/tr/td[16]")
  cell(:grps_station, :xpath => "html/body/div[2]/span[21]/div/div[2]/div/div/div/div/div[3]/span/div/div/div[3]/table/tbody/tr/td[17]")




#demographics and stations
  link(:hour_by_hour, :xpath => "//*[@id='tabstrip-tools']/ul/li[4]/a")


#   button(:insert_button, :id => "insertRow")
#   button(:insert_streaming_button, :xpath => "html/body/div[2]/div[7]/div[2]/div/div/div[1]/button[2]")
#
#
   button(:insert_digital_button, :xpath => "html/body/div[2]/div[7]/div[3]/div/div/div[1]/button[2]")
#   button(:insert_miscellaneous_button, :xpath =>"html/body/div[2]/div[7]/div[4]/div/div/div[1]/button[2]")
#
#
#   checkbox(:rtg_streaming, :name => 'rtgs')
#
# cell(:station, :xpath=> "//*[@id='broadcast']/div[3]/table/tbody/tr[2]/td[5]")
#
# unordered_list(:station_type, :xpath => "html/body/div[43]/div/ul/li[6]")
# span(:station_name, :xpath => '//*[@id="broadcast_active_cell"]/span/span/span[1]')

  # #clone proposal
  # radio_button(:without_products, :value => "WithoutProducts")
  # button(:clone_opportunity, :value => "Clone Opportunity")
  # link(:recent_proposal, :xpath => "//*[@id='006V0000006dHPm_00NE0000005UEpz_body']/table/tbody/tr[2]/th/a")

####Pranay elements

  button(:insert_button, :id => 'insertRow')
  button(:insert_streaming_button, :xpath => "html/body/div[2]/div[7]/div[2]/div/div/div[1]/button[2]")

  cell(:station , :xpath=> 'html/body/div[2]/div[7]/div[1]/div/div/div[3]/table/tbody/tr[2]/td[5]')
  span(:station_name, :xpath => '//*[@id="broadcast_active_cell"]/span/span/span[1]')
# span(:station_name , :xpath=>"//*[@id='broadcast_active_cell']/span/span/span[1]")
  div(:list_station, :xpath => 'html/body/div[47]/div')
  text_field(:station_2, :xpath=> ".//*[@id='ai_flightGroupHeader']/div/table/tbody/tr[4]/td[2]/span/span/input")
  text_field(:bind_2, :xpath=> '//*[@id="ai_flightGroupHeader"]/div/table/tbody/tr[8]/td[2]/span/span/input')
  text_field(:spot_2, :xpath => "//*[@id='ai_flightGroupHeader']/div/table/tbody/tr[9]/td[2]/span/span/input")
  text_field(:spot_22, :xpath => "//*[@id='ai_orderLineSetupHeader']/div/table[1]/tbody/tr[2]/td[2]/span/span/input[1]")
  span(:increase_spot, :xpath => "//*[@id='ai_orderLineSetupHeader']/div/table[1]/tbody/tr[2]/td[2]/span/span/span/span[1]/span")
  cell(:spot_11, :xpath => 'html/body/div[2]/div[7]/div[1]/div/div/div[3]/table/tbody/tr[2]/td[12]')
  cell(:start_date,:xpath => "html/body/div[2]/div[7]/div[1]/div/div/div[3]/table/tbody/tr/td[5]")
  cell(:end_date, :xpath => 'html/body/div[2]/div[7]/div[1]/div/div/div[3]/table/tbody/tr[2]/td[7]')

  cell(:start_date_s,:xpath => "html/body/div[2]/div[7]/div[2]/div/div/div[3]/table/tbody/tr[2]/td[6]")
  cell(:end_date_s, :xpath => 'html/body/div[2]/div[7]/div[2]/div/div/div[3]/table/tbody/tr[2]/td[7]')
  text_field(:start_date_1_s ,:xpath => 'html/body/div[2]/div[7]/div[2]/div/div/div[3]/table/tbody/tr[2]/td[6]/span[1]/span/input')
  text_field(:end_date_1_s ,:xpath => 'html/body/div[2]/div[7]/div[2]/div/div/div[3]/table/tbody/tr[2]/td[7]/span[1]/span/input')
  cell(:first_row_s, :xpath => '//*[@id="streaming"]/div[3]/table/tbody/tr[2]/td[1]')
  radio_button(:digital_radio_button, :xpath => 'html/body/div[2]/span[21]/div/div[2]/table/tbody/tr/td[4]/label[3]/input')
  button(:insert_digital, :xpath => 'html/body/div[2]/div[7]/div[3]/div/div/div[1]/button[2]')


  # text_field(:station_digital, :xpath => 'html/body/div[2]/div[8]/span[2]/div/div[1]/div[2]/ul/li[1]/div/table/tbody/tr[4]/td[2]/span/span/input')
  # text_field(:end_date_digital, :xpath => 'html/body/div[2]/div[8]/span[2]/div/div[1]/div[2]/ul/li[1]/div/table/tbody/tr[3]/td[2]/span/span/input')
  button(:columns_digital, :xpath => '//*[@id="digital"]/div[1]/button[4]')
  checkbox(:start_date_check, :id => 'cc_ai_startDate')
  checkbox(:end_date_check, :id => 'cc_ai_endDate')
  button(:ok_d, :xpath => '//*[@id="cc_mainDiv"]/table[2]/tbody/tr/td[2]/input[1]')
  span(:assert, :xpath => 'html/body/div[2]/div[8]/span[2]/div/div[1]/div[2]/ul/li[2]/div/table[2]/tbody/tr[2]/td[2]/span/span/span[1]')
  unordered_list(:assert_type, :id => "ai_asset_listbox")
  span(:digital_rev, :xpath => 'html/body/div[2]/div[8]/span[2]/div/div[1]/div[2]/ul/li[2]/div/table[2]/tbody/tr[3]/td[2]/span/span/span[1]')
  unordered_list(:digital_rev_type, :id => "ai_digitalRevType_listbox")
  span(:viero_ae, :xpath => "html/body/div[2]/div[8]/span[2]/div/div[1]/div[2]/ul/li[2]/div/table[2]/tbody/tr[5]/td[2]/span/span/span[1]")
  unordered_list(:viero_ae_2, :id => "ai_ae_listbox")
  cell(:sov_click, :xpath => 'html/body/div[2]/div[7]/div[3]/div/div/div[3]/table/tbody/tr[2]/td[9]')

  text_field(:sov, :xpath => 'html/body/div[2]/div[7]/div[3]/div/div/div[3]/table/tbody/tr[2]/td[9]/span[1]/span/input[2]')
  text_field(:impression, :id => 'ai_orderedImpressions')
  cell(:impression_click,:xpath=>"//*[@id='ai_ratesHeader']/div/table[2]/tbody/tr[2]/td[2]/span/span/input[1]")


  button(:insert_misc, :xpath => 'html/body/div[2]/div[7]/div[4]/div/div/div[1]/button[2]')

  radio_button(:misc, :xpath => 'html/body/div[2]/span[21]/div/div[2]/table/tbody/tr/td[4]/label[4]/input')
  cell(:start_date_m, :xpath => 'html/body/div[2]/div[7]/div[4]/div/div/div[3]/table/tbody/tr[2]/td[5]')
  text_field(:start_date_misc, :xpath => 'html/body/div[2]/div[7]/div[4]/div/div/div[3]/table/tbody/tr[2]/td[5]/span[1]/span/input')
  cell(:end_date_m, :xpath => 'html/body/div[2]/div[7]/div[4]/div/div/div[3]/table/tbody/tr[2]/td[6]')
  text_field(:end_date_misc, :xpath => 'html/body/div[2]/div[7]/div[4]/div/div/div[3]/table/tbody/tr[2]/td[6]/span[1]/span/input')
  span(:misc_1, :xpath => 'html/body/div[2]/div[8]/span[2]/div/div[1]/div[2]/ul/li[2]/div/table[2]/tbody/tr[4]/td[2]/span/span/span[1]')
  unordered_list(:misc_type,:id => "ai_miscRevType_listbox")


  span(:mo_qty, :xpath => "html/body/div[2]/div[8]/span[2]/div/div[1]/div[2]/ul/li[3]/div/table[1]/tbody/tr[16]/td[2]/span/span/span/span[1]/span")

  text_field(:mo_qty1, :id => "miscellaneous_active_cell")
  span(:run_weeks_3, :xpath => "//*[@id='ai_runWeeksRow']/td[2]/span/span/span/span")
  text_field(:run_start_date, :xpath => "html/body/div[5]/div/form/table[1]/tbody/tr[1]/td[2]/span/span/input")
  text_field(:run_end_date, :xpath => "html/body/div[5]/div/form/table[1]/tbody/tr[2]/td[2]/span/span/input")
  div(:ok_button, :id => "rw_btnOK")


  ##digital proposal line
  text_field(:start_date_digital, :id => "ai_startDate")
  text_field(:end_date_digital, :id => "ai_endDate")
  text_field(:station_digital, :xpath => "//*[@id='ai_flightGroupHeader']/div/table/tbody/tr[4]/td[2]/span/span/input")
  unordered_list(:asset_digital, :xpath => "html/body/div[2]/div[7]/div[3]/div/div/div[3]/table/tbody/tr[2]/td[7]/span/span/span[1]")



  ##misc proposal lines

#-----------flight creator
  link(:flight_creator,:xpath =>"html/body/div[12]/div[2]/span/div/div/div/ul/li[2]/a")
  div(:flight_creator_station,:xpath=> "//*[@id='lc_tabstrip-2']/div[1]/table/tbody/tr/td[1]/table/tbody/tr[1]/td[2]/div/div")
  li(:wend_fm,:xpath=>"//*[@id='fc_station_listbox']/li[2]"  )
  li(:wlko_fm,:xpath=>"//*[@id='fc_station_listbox']/li[5]"  )
  li(:wwpw_fm,:xpath=>"//*[@id='fc_station_listbox']/li[15]"  )
  li(:iend_fm,:xpath=>"//*[@id='fc_station_listbox']/li[2]"  )
  text_field(:flight_end_date,:xpath=>'html/body/div[5]/div/form/table[1]/tbody/tr[2]/td[2]/span/span/input')
  button(:flight_ok,:xpath=>'html/body/div[5]/div/form/div[2]/input[1]')
  div(:flight_spot_length,:xpath=>"//*[@id='lc_tabstrip-2']/div[1]/table/tbody/tr/td[1]/table/tbody/tr[3]/td[2]/div/div")
  li(:spot_60,:xpath=>'html/body/div[58]/div/ul/li[3]')
  div(:flight_bind_to,:xpath=>"//*[@id='lc_tabstrip-2']/div[1]/table/tbody/tr/td[2]/table/tbody/tr[1]/td[2]/div")
  li(:bind_fl_1,:xpath=>"//*[@id='fc_bindTo_option_selected']")
  li(:bind_fl_2,:xpath=>"//*[@id='fc_bindTo_listbox']/li[2]")
  span(:flight_break_type,:xpath=>"html/body/div[13]/div[2]/span/div/div/div/div[2]/div[1]/table/tbody/tr/td[2]/table/tbody/tr[2]/td[2]/span/span/span[2]/span")
  text_field(:flight_revenue_type,:xpath=>'html/body/div[13]/div[2]/span/div/div/div/div[2]/div[1]/table/tbody/tr/td[2]/table/tbody/tr[3]/td[2]/span/input')
  button(:add_flight,:xpath=>'html/body/div[13]/div[2]/span/div/div/div/div[2]/div[2]/div[2]/button')
  span(:flight_close,:xpath=>'html/body/div[13]/div[1]/div/a[3]/span')
  span(:flight_close_before,:xpath=>'html/body/div[12]/div[1]/div/a[3]/span')
  text_field(:flight_rate,:xpath=>"//*[@id='fc_rate']")
  li(:commercial,:xpath=>'html/body/div[59]/div/ul/li[26]')
  text_field(:flight_week,:xpath=>'html/body/div[13]/div[2]/span/div/div/div/div[2]/div[1]/table/tbody/tr/td[1]/table/tbody/tr[4]/td[2]/span/span/input[2]')
  button(:proposal_save,:xpath=>'html/body//div[2]/div[2]/button[1]')

  div(:graph_area,:xpath=>'html/body/div[2]/span[21]/div/div[2]/div/div/div/div/div[4]/span/div[2]/div[3]/div/div[3]')


  cell(:proposal_line_1,:xpath=>'html/body/div[2]/div[7]/div[1]/div/div/div[3]/table/tbody/tr[2]/td[2]')
  cell(:proposal_line_2,:xpath=>'html/body/div[2]/div[7]/div[1]/div/div/div[3]/table/tbody/tr[3]/td[2]')
  div(:clear_all,:text=>'Clear All')
  cell(:proposal_start_date,:xpath=>"html/body/div/div[2]/table/tbody/tr/td[2]/div[4]/div[2]/div[2]/table/tbody/tr[5]/td[4]")
  cell(:proposal_end_date,:xpath=>"html/body/div/div[2]/table/tbody/tr/td[2]/div[4]/div[2]/div[2]/table/tbody/tr[6]/td[4]")
  link(:back_to_oppr,:xpath=>"//*[@id='ep']/div[2]/div[2]/table/tbody/tr[2]/td[2]/a")
  cell(:first_broadcast_product,:xpath=>"//*[@id='broadcast']/div[3]/table/tbody/tr[2]/td[2]")
  cell(:first_streaming_product,:xpath=>"//*[@id='streaming']/div[3]/table/tbody/tr[2]/td[2]")
  cell(:first_digital_product,:xpath=>"//*[@id='digital']/div[3]/table/tbody/tr[2]/td[2]")

  button(:ok,:text=>'OK')
  button(:delete_digital_button, :xpath => "//*[@id='digital']/div[1]/button[3]")
  button(:delete_broadcast_button, :xpath => "//*[@id='broadcast']/div[1]/button[3]")
  button(:delete_streaming_button, :xpath => "//*[@id='streaming']/div[1]/button[3]")
  button(:delete_miscellaneous_button, :xpath => "//*[@id='miscellaneous']/div[1]/button[3]")



















# span(:station_name , :xpath=>"//*[@id='broadcast_active_cell']/span/span/span[1]")
# div(:list_station, :xpath => 'html/body/div[47]/div')

#pranay added
  # cell(:station_33, :xpath => 'html/body/div[2]/div[7]/div[1]/div/div/div[3]/table/tbody/tr[5]/td[5]')
  #
  # cell(:verify_line_1, :xpath => "html/body/div[2]/div[7]/div[1]/div/div/div[3]/table/tbody/tr[2]/td[4]")
  # cell(:verify_line_2, :xpath => "html/body/div[2]/div[7]/div[1]/div/div/div[3]/table/tbody/tr[3]/td[4]")
  # cell(:verify_line_3, :xpath => "html/body/div[2]/div[7]/div[1]/div/div/div[3]/table/tbody/tr[4]/td[4]")
  # cell(:verify_line_4, :xpath => "html/body/div[2]/div[7]/div[1]/div/div/div[3]/table/tbody/tr[5]/td[4]")

#sravan
  span(:run_date, :xpath => '//*[@id="ai_runWeeksRow"]/td[2]/span/span/span/span')
  text_field(:start_date_1 ,:name => 'rw_startDate')
  text_field(:end_date_1 ,:name => 'rw_endDate')
  text_field(:spot_length ,:xpath => '//*[@id="ai_flightGroupHeader"]/div/table/tbody/tr[9]/td[2]/span/span/input')
  text_field(:bind_to, :xpath => '//*[@id="broadcast_active_cell"]/span/span/input')
  span(:break_type, :xpath => 'html/body/div[2]/div[8]/span[2]/div/div[1]/div[2]/ul/li[2]/div/table[1]/tbody/tr[5]/td[2]/span/span/span[1]')

  span(:viero_ae, :xpath => "html/body/div[2]/div[8]/span[2]/div/div[1]/div[2]/ul/li[2]/div/table[2]/tbody/tr[5]/td[2]/span/span/span[1]")
  unordered_list(:viero_ae_2, :id => "ai_ae_listbox")
  unordered_list(:break_type_2, :id => 'ai_breakType_listbox')
  div(:break_type_3, :id => "ai_breakType-list")

  cell(:weeks, :xpath => 'html/body/div[2]/div[7]/div[1]/div/div/div[3]/table/tbody/tr[2]/td[8]/span[1]/span/input[2]')
 unordered_list(:save_proposal, :id => 'proposalLineMenu')





  # for digital proposal
  # cell(:digital_station, :xpath =>'html/body/div[2]/div[7]/div[3]/div/div/div[3]/table/tbody/tr[2]/td[4]')
  # span(:digital_station_name, :xpath =>'html/body/div[2]/div[7]/div[3]/div/div/div[3]/table/tbody/tr[2]/td[4]/span/span/span[1]')
  # div(:digital_list_station, :xpath => 'html/body/div[46]/div')
  # text_field(:digital_start_date_1 ,:xpath => 'html/body/div[2]/div[7]/div[3]/div/div/div[3]/table/tbody/tr[2]/td[5]/span[1]/span/input')
  # text_field(:digital_end_date_1 ,:xpath => 'html/body/div[2]/div[7]/div[3]/div/div/div[3]/table/tbody/tr[2]/td[6]/span[1]/span/input')
  text_field(:order_impressions, :xpath => "//*[@id='digital_active_cell']/span[1]/span/input[2]")
  span(:allocation_close,:xpath=>'html/body/div[15]/div[1]/div/a/span')

#For line creater and flight
  button(:line_creator_button, :xpath =>"//*[@id='broadcast']/div[1]/button[1]")
  link(:flight_button, :link_text =>"Flight")
  link(:flight_button_streaming, :xpath => "//*[@id='lc_tabstrip']/ul/li[2]")
text_field(:run_weeks, :xpath =>"html/body/div[13]/div[2]/span/div/div/div/div[2]/div[1]/table/tbody/tr/td[1]/table/tbody/tr[2]/td[2]/span/span/input")
  span(:run_weeks2, :xpath =>"html/body/div[13]/div[2]/span/div/div/div/div[2]/div[1]/table/tbody/tr/td[1]/table/tbody/tr[2]/td[2]/span/span/span/span")
 text_field(:start_date_flight, :id =>"rw_startDate")

  #line item for streaming
  button(:line_creator_streaming, :xpath => "//*[@id='streaming']/div[1]/button[1]")
  button(:line_creator_digital, :xath => "//*[@id='digital']/div[1]/button[1]")
  button(:line_creator_misc, :xpath => "//*[@id='miscellaneous']/div[1]/button[1]")



  # back to proposal and back to opportunity
  span(:links_back, :xpath => "html/body/div[2]/span[21]/div/div[1]/ul/li[5]/span")
  unordered_list(:back_to_links, :xpath => "html/body/div[2]/span[21]/div/div[1]/ul/li[5]/div/ul")

  text_field(:spot_length, :xpath =>"html/body/div[13]/div[2]/span/div/div/div/div[2]/div[1]/table/tbody/tr/td[1]/table/tbody/tr[3]/td[2]/div/div")
  text_field(:spots_weeks, :xpath =>"html/body/div[12]/div[2]/span/div/div/div/div[2]/div[1]/table/tbody/tr/td[1]/table/tbody/tr[4]/td[2]/span/span/input[1]")
  text_field(:rate, :xpath =>"html/body/div[12]/div[2]/span/div/div/div/div[2]/div[1]/table/tbody/tr/td[1]/table/tbody/tr[5]/td[2]/span/span/input[1]")
  span(:break_type_flight, :xpath =>"html/body/div[13]/div[2]/span/div/div/div/div[2]/div[1]/table/tbody/tr/td[2]/table/tbody/tr[2]/td[2]/span/span/span[1]")
  unordered_list(:break_type_flight2, :id =>"fc_breakType_listbox")
  span(:revenue_type_flight, :xpath =>"html/body/div[13]/div[2]/span/div/div/div/div[2]/div[1]/table/tbody/tr/td[2]/table/tbody/tr[3]/td[2]/span/span/span[1]")
  unordered_list(:revenue_type_flight2, :id =>"fc_revenueType_listbox")
  span(:flex_scheduling, :xpath =>"html/body/div[13]/div[2]/span/div/div/div/div[2]/div[1]/table/tbody/tr/td[2]/table/tbody/tr[4]/td[2]/span/span/span[1]")
  unordered_list(:flex_scheduling2, :id =>"fc_flexSchedule_listbox")
  text_field(:flight_name, :id =>"fc_flightName")
  link(:close_flight, :xpath =>"html/body/div[13]/div[1]/div/a[3]")
  button(:duplicate_button, :value => "Duplicate")


  #controversial program
  span(:controversial_program_button, :xpath =>"//*[@id='ai_proposalLineExcludedControversialsRow']/td[2]/span/span/span/span")
  button(:save_controversial_button, :xpath =>"//*[@id='rw_ProposalExcludeWindow']/button[1]")
  unordered_list(:type, :id => "broadcast_active_cell")
  #for proposals Pranay
  # text_field(:station_2, :xpath=> ".//*[@id='ai_flightGroupHeader']/div/table/tbody/tr[4]/td[2]/span/span/input")
  # text_field(:bind_2, :xpath=> '//*[@id="ai_flightGroupHeader"]/div/table/tbody/tr[8]/td[2]/span/span/input')
  # text_field(:spot_2, :xpath => '//*[@id="ai_flightGroupHeader"]/div/table/tbody/tr[9]/td[2]/span/span/input')
  # text_field(:spot_22, :xpath => 'html/body/div[2]/div[8]/span[2]/div/div[1]/div[2]/ul/li[2]/div/table[1]/tbody/tr[2]/td[2]/span/span/input[2]')
  # cell(:spot_11, :xpath => 'html/body/div[2]/div[7]/div[1]/div/div/div[3]/table/tbody/tr[2]/td[12]')
  # cell(:start_date,:xpath => "html/body/div[2]/div[7]/div[1]/div/div/div[3]/table/tbody/tr[2]/td[6]")
  # cell(:end_date, :xpath => "html/body/div[2]/div[7]/div[1]/div/div/div[3]/table/tbody/tr[2]/td[7]")
  #
  # cell(:start_date_s,:xpath => "html/body/div[2]/div[7]/div[2]/div/div/div[3]/table/tbody/tr[2]/td[6]")
  # cell(:end_date_s, :xpath => 'html/body/div[2]/div[7]/div[2]/div/div/div[3]/table/tbody/tr[2]/td[7]')
  #
  # text_field(:start_date_1_s ,:xpath => 'html/body/div[2]/div[7]/div[2]/div/div/div[3]/table/tbody/tr[2]/td[6]/span[1]/span/input')
  # text_field(:end_date_1_s ,:xpath => 'html/body/div[2]/div[7]/div[2]/div/div/div[3]/table/tbody/tr[2]/td[7]/span[1]/span/input')

#for flights

  text_field(:flight_station, :xpath => "//*[@id='lc_tabstrip-2']/div[1]/table/tbody/tr/td[1]/table/tbody/tr[1]/td[2]/div/div/input")
  span(:flight_run_weeks, :xpath => "//*[@id='lc_tabstrip-2']/div[1]/table/tbody/tr/td[1]/table/tbody/tr[2]/td[2]/span/span/span/span")

  text_field(:flight_start_date, :xpath => "//*[@id='rw_startDate']")
  text_field(:flight_end_date, :xpath => "//*[@id='rw_endDate']")
  button(:flight_ok_button, :id => "rw_btnOK")
  text_field(:flight_spot_length, :xpath => "//ul[@id = 'fc_spotLength_taglist']/following-sibling::input")
  text_field(:flight_spot_week, :xpath => "//*[@id='lc_tabstrip-2']/div[1]/table/tbody/tr/td[1]/table/tbody/tr[4]/td[2]/span/span/input[1]")
  link(:spot_length_15, :xpath => "//*[@id='fc_spotLength_listbox']/li[1]")
  # div(:spotlength_box, :id => "fc_spotLength_listbox")
  list_items(:spotlength_box, :xpath => "//ul[@id = 'fc_spotLength_listbox']/li")
  text_field(:flight_bind_to, :xpath => "//ul[@id ='fc_bindTo_taglist']/following-sibling::input")
  list_items(:bind_to_box, :xpath => "//ul[@id = 'fc_bindTo_listbox']/li")
  list_items(:flight_break_type_2, :xpath => "//ul[@id = 'fc_breakType_listbox']/li")
  span(:flight_break_type, :xpath => "html/body/div[13]/div[2]/span/div/div/div/div[2]/div[1]/table/tbody/tr/td[2]/table/tbody/tr[2]/td[2]/span/span/span[1]")
  list_items(:revenue_type_2, :xpath => "//ul[@id = 'fc_revenueType_listbox']/li")
  span(:revenue_type, :xpath => "html/body/div[13]/div[2]/span/div/div/div/div[2]/div[1]/table/tbody/tr/td[2]/table/tbody/tr[3]/td[2]/span/span/span[1]")
  span(:flight_flex_scheduling, :xpath => "html/body/div[13]/div[2]/span/div/div/div/div[2]/div[1]/table/tbody/tr/td[2]/table/tbody/tr[4]/td[2]/span/span/span[1]")
  list_items(:flight_flex_scheduling_2, :xpath => "//ul[@id = 'fc_flexSchedule_listbox']/li")
  button(:add_flight, :xpath => "//*[@id='lc_tabstrip-2']/div[2]/div[2]/button")
  span(:flight_close, :xpath => "/html/body/div[12]/div[1]/div/a[3]/span")

#delete orders
  button(:delete_opportunity, :value => "Delete")
  button(:delete_proposallines, :value => "Delete")

button(:preview_pdf, :id => "btnPreviewPdf")

#verify cells

  cell(:first_cell, :xpath => "html/body/div[2]/div[7]/div[2]/div/div/div[3]/table/tbody/tr[2]/td[1] ")

  cell(:second_cell, :xpath => "html/body/div[2]/div[7]/div[2]/div/div/div[3]/table/tbody/tr[5]/td[1]")
  cell(:third_cell, :xpath => "html/body/div[2]/div[7]/div[2]/div/div/div[3]/table/tbody/tr[8]/td[1]")
  cell(:mis_first_cell, :xpath => "html/body/div[2]/div[7]/div[4]/div/div/div[3]/table/tbody/tr[2]/td[1]")
  cell(:dig_first_cell, :xpath => "html/body/div[2]/div[7]/div[3]/div/div/div[3]/table/tbody/tr[2]/td[1]")


###########################################################################################--Riaze Elements -start

  in_frame(:id => 'toolframeProposalOutput') do |frame|
    button(:previewpdf, :id => 'btnPreviewPdf',:frame => frame)
  end
  cell(:proposal_number,:class=>'headerMainTitle')
  button(:clone_proposal,:name => 'duplicate_proposal')
  button(:line_creator,:xpath=>"//*[@id='broadcast']/div[1]/button[1]")

  link(:opportunity_value,:id=>'lookup0060j000008RQRe00NE0000005UEpz')
  cell(:status,:xpath=>"//*[@id='ep']/div[2]/div[2]/table/tbody/tr[7]/td[4]")

  cell(:station_exp_1,:xpath=>"html/body/div[2]/div[7]/div[1]/div/div/div[3]/table/tbody/tr[2]/td[5]")
  cell(:start_date_exp_1,:xpath=>"html/body/div[2]/div[7]/div[1]/div/div/div[3]/table/tbody/tr[2]/td[6]")
  cell(:end_date_exp_1,:xpath=>"html/body/div[2]/div[7]/div[1]/div/div/div[3]/table/tbody/tr[2]/td[7]")
  cell(:wks_exp_1,:xpath=>'html/body/div[2]/div[7]/div[1]/div/div/div[3]/table/tbody/tr[2]/td[8]')
  cell(:len_exp_1,:xpath=>'html/body/div[2]/div[7]/div[1]/div/div/div[3]/table/tbody/tr[2]/td[9]')
  cell(:type_exp_1,:xpath=>'html/body/div[2]/div[7]/div[1]/div/div/div[3]/table/tbody/tr[2]/td[10]')
  cell(:bind_to_exp_1,:xpath=>'html/body/div[2]/div[7]/div[1]/div/div/div[3]/table/tbody/tr[2]/td[11]')
  cell(:spot_exp_1,:xpath=>'html/body/div[2]/div[7]/div[1]/div/div/div[3]/table/tbody/tr[2]/td[12]')
  cell(:rate_exp_1,:xpath=>'html/body/div[2]/div[7]/div[1]/div/div/div[3]/table/tbody/tr[2]/td[20]')



#-----------flight creator
  link(:flight_creator,:xpath =>"html/body/div[12]/div[2]/span/div/div/div/ul/li[2]/a")
  div(:flight_creator_station,:xpath=> "//*[@id='lc_tabstrip-2']/div[1]/table/tbody/tr/td[1]/table/tbody/tr[1]/td[2]/div/div")
  li(:wend_fm,:xpath=>"//*[@id='fc_station_listbox']/li[2]"  )
  li(:wlko_fm,:xpath=>"//*[@id='fc_station_listbox']/li[5]"  )
  li(:wrfx_fm,:xpath=>"//*[@id='fc_station_listbox']/li[6]"  )

  text_field(:flight_end_date,:xpath=>'html/body/div[5]/div/form/table[1]/tbody/tr[2]/td[2]/span/span/input')
  button(:flight_ok,:xpath=>'html/body/div[5]/div/form/div[2]/input[1]')
  div(:flight_spot_length,:xpath=>"//*[@id='lc_tabstrip-2']/div[1]/table/tbody/tr/td[1]/table/tbody/tr[3]/td[2]/div/div")
  li(:spot_60,:xpath=>'html/body/div[58]/div/ul/li[3]')
  div(:flight_bind_to,:xpath=>"//*[@id='lc_tabstrip-2']/div[1]/table/tbody/tr/td[2]/table/tbody/tr[1]/td[2]/div")
  li(:bind_fl_1,:xpath=>"//*[@id='fc_bindTo_option_selected']")
  li(:bind_fl_2,:xpath=>"//*[@id='fc_bindTo_listbox']/li[2]")
  span(:flight_break_type,:xpath=>"html/body/div[13]/div[2]/span/div/div/div/div[2]/div[1]/table/tbody/tr/td[2]/table/tbody/tr[2]/td[2]/span/span/span[2]/span")
  text_field(:flight_revenue_type,:xpath=>'html/body/div[13]/div[2]/span/div/div/div/div[2]/div[1]/table/tbody/tr/td[2]/table/tbody/tr[3]/td[2]/span/input')
  button(:add_flight,:xpath=>'html/body/div[13]/div[2]/span/div/div/div/div[2]/div[2]/div[2]/button')
  span(:flight_close,:xpath=>'html/body/div[13]/div[1]/div/a[3]/span')
  text_field(:flight_rate,:xpath=>"//*[@id='fc_rate']")
  li(:commercial,:xpath=>'html/body/div[59]/div/ul/li[26]')
  text_field(:flight_week,:xpath=>'html/body/div[13]/div[2]/span/div/div/div/div[2]/div[1]/table/tbody/tr/td[1]/table/tbody/tr[4]/td[2]/span/span/input[2]')
  button(:proposal_save,:xpath=>"html/body//div[2]/div[2]/button[@class='dialog-confirm k-button'][1]")

  div(:graph_area,:xpath=>'html/body/div[2]/span[21]/div/div[2]/div/div/div/div/div[4]/span/div[2]/div[3]/div/div[3]')


  cell(:proposal_line_1,:xpath=>'html/body/div[2]/div[7]/div[1]/div/div/div[3]/table/tbody/tr[2]/td[2]')
  cell(:proposal_line_2,:xpath=>'html/body/div[2]/div[7]/div[1]/div/div/div[3]/table/tbody/tr[3]/td[2]')
  in_frame(:id => 'toolframeProposalOutput') do |frame|
    radio_button(:gross_cost,:xpath=>'html/body/div[2]/div[1]/span/input[1]',:frame => frame)
  end
  in_frame(:id => 'toolframeProposalOutput') do |frame|
    radio_button(:net_cost,:xpath=>'html/body/div[2]/div[1]/span/input[2]',:frame => frame)
  end
  in_frame(:id => 'toolframeProposalOutput') do |frame|
    radio_button(:net_gross_cost,:xpath=>'html/body/div[2]/div[1]/span/input[3]',:frame => frame)
  end

    span(:close_output,:xpath=>'html/body/div[7]/div[1]/div/a/span')

    span(:total_cost,:id=>'grandTotalCost')

# Name: hout_by_hour_graph
# Input: No input is needed.
# Purpose: checks for the hour_by hour graph

  def hour_by_hour_graph
    flag = false
    path = 'M0 0 L 875 0 875 190 0 190Z'

    @browser.elements(:css=>"path").each do |x|

      if x.attribute_value("d") == path
        p path + '<---------------->' + x.attribute_value("d")
        flag = true

      else
        flag = false
      end
      break if x.attribute_value("d") == path
    end
    return  flag
  end

# Name: verify_the_graph
# Input: para, value
# Purpose: verifes the grapgh
  def verify_the_graph (para,value)

    Watir::Wait.until(15){self.graph_area_element.exists?}
    a = false
    p self.graph_area_element
    area = self.graph_area_element
    co = area.attribute_value("style")
    p co + '<------------->' + value
    if co.include?value.to_s
      a = true
    else
      a = false
    end
    return a
  end
#-----------flight creator

############################################################################################--Riaze Elements -End



# Name: form_field_order
# Input: No input is needed.
# Purpose: Fills the details of the various fields in required order

  def form_field_order
    %w{
      start_date_1
    }
  end

# Name: data_class
# Input:  No input is needed.
# Purpose: Return the data class for the page

  def self.data_class
    SalesforceNewProposalPageData
  end

# Name: page_title_validation_value
# Input: none
# Purpose: return the validation value for the page title

  def self.page_title_validation_value
    # /Proposal Edit/
    //
  end

# Name: page_url_validation_value
# Input: none
# Purpose: return the validation value for the page url

  def self.page_url_validation_value
    //
  end

end





