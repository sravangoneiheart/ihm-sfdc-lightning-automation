class SalesforceMarketingSolutionsRequestPage < WebPage

select_list(:presented_or_submitted, :name => "00NE0000005Vy6y")
select_list(:market_materials, :id => "00NE0000005Vy72_unselected")
link(:market_materials_2, :xpath => "html/body/div[1]/div[2]/table/tbody/tr/td[2]/form/div/div[2]/div[4]/table/tbody/tr[1]/td[2]/table/tbody/tr[2]/td[1]/span/select/option[2]")
img(:right_arrow, :src => "/img/s.gif")
text_field(:internal_due_date, :id => "00NE0000005Vy71")
text_field(:external_presentation_date, :id => "00NE0000005Vy6x")
text_field(:budget, :id => "00NE0000005Vy6p")
text_field(:regional_manager, :id => "CF00NE0000005Vy74")
button(:save_button, :value => " Save ")
div(:marketing_form_value, :xpath => "//*[@id='Name_ileinner']")
div(:status_value, :id => "00NE0000005Vy76_ileinner")
div(:account_status_value, :id => "00NE0000005Vy6l_ileinner")
div(:opportunity_value, :id => "CF00NE0000005Vy6k_ileinner")
div(:opportunity_stage_value, :id => "00NE0000005Vy75_ileinner")
div(:sales_representative_value, :id => "00NE0000005kGj2_ileinner")
div(:selling_office_value, :id => "00NE0000005kGj3_ileinner")
div(:present_submitted_value, :id => "00NE0000005Vy6y_ileinner")
text_field(:budget_value, :id => "00NE0000005Vy6p")
text_field(:regional_manager_value, :id => "CF00NE0000005Vy74")
text_field(:client_brief, :id => "00NE0000005Vy6s")
text_field(:client_objectives, :id => "00NE0000005Vy6u")
text_field(:client_challanges, :id => "00NE0000005Vy6t")
text_field(:client_timing, :id => "00NE0000005Vy6q")
text_field(:national_or_multi, :id => "00N44000006BUbx")
text_field(:client_audience, :id => "00NE0000005Vy6w")
text_field(:how_will_the_client_measure, :id => "00NE0000005Vy6v")
text_field(:is_the_opp_from_the_client_or_agency, :id => "00N44000006BUbv")
text_field(:ihm_only_campaign, :id => "00N44000006BUby")
text_field(:opportunity, :id => "CF00NE0000005Vy6k")
button(:save_button, :value => " Save ")
checkbox(:strategic_partnership, :id => "00N0j000000HpsC")
select_list(:approval_status, :id => "00N0j000000Hps9")
text_field(:rejection_comments, :id => "00N0j000000HpsB")
select_list(:level_of_involvement, :id => "00N0j000000HpsA")








def form_field_order
  %w{
    presented_or_submitted
    internal_due_date
    external_presentation_date
    budget
    regional_manager
    client_brief
    client_objectives
    client_challanges
    client_timing
    national_or_multi
    client_audience
    how_will_the_client_measure
    is_the_opp_from_the_client_or_agency
    ihm_only_campaign


    }
end
  def self.data_class
    SalesforceMarketingSolutionsRequestPageData
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
    /a2A/
  end


end