class SalesforceMpBudgetAllocationPage < WebPage


  link(:add_row_link, :link_text => "Add Row")
  #select_list(:division, :id => "j_id0:frm:pblk:opptable:0:j_id63")
  text_field(:owner, :name => 'j_id0:frm:pblk:opptable:0:j_id65')
  text_field(:budget_amount, :name => 'j_id0:frm:pblk:opptable:0:j_id71')
  button(:save_button, :xpath => 'html/body/div[1]/div[2]/table/tbody/tr/td[2]/form/div[2]/div/div/div/div[1]/table/tbody/tr/td[2]/input[1]')
  link(:child, :link_text => 'TestAcc201-Pranay Test- CH -MMS')
  link(:first_child, :xpath => '//*[@id="j_id0:frm:budgetExistblock:j_id85:0:j_id86"]/a')
  link(:second_child, :xpath => '//*[@id="j_id0:frm:budgetExistblock:j_id85:1:j_id86"]/a')
  link(:third_child, :xpath => '//*[@id="j_id0:frm:budgetExistblock:j_id85:2:j_id86"]/a')
  button(:done_button, :xpath => "//*[@id='j_id0:frm:pblk:pblkbtn']/input[2]")


  cell(:total_proposal_dollars_value, :xpath => '//*[@id="j_id0:frm:pblk"]/div[2]/table/tbody/tr[5]/td[1]')
  span(:total_budget_available_value, :id => 'j_id0:frm:pblk:j_id43')
  cell(:total_budget_allocated_value, :xpath => 'html/body/div[1]/div[2]/table/tbody/tr/td[2]/form/div[2]/div/div/div/div[2]/table/tbody/tr[3]/td')
  cell(:budget_remaining_value, :xpath => 'html/body/div[1]/div[2]/table/tbody/tr/td[2]/form/div[2]/div/div/div/div[2]/table/tbody/tr[4]/td')
  cell(:first_child_allocated_net_amount_value, :xpath => 'html/body/div[1]/div[2]/table/tbody/tr/td[2]/form/div[3]/div/div/div/div[2]/span/span[2]/span/table/tbody/tr/td[5]')
  cell(:second_child_allocated_net_amount_value, :id => 'j_id0:frm:budgetExistblock:j_id85:1:j_id100')
  span(:first_child_stage_value, :xpath => '//*[@id="j_id0:frm:budgetExistblock:j_id85:0:j_id116"]')
  span(:second_child_stage_value, :xpath => '//*[@id="j_id0:frm:budgetExistblock:j_id85:1:j_id116"]')
  span(:third_child_stage_value, :xpath => '//*[@id="j_id0:frm:budgetExistblock:j_id85:2:j_id116"]')

  #table(:, :id => 'j_id0:frm:budgetExistblock:j_id85:0:j_id100')



## color
   img(:first_child_greater_than_allocated, :src=> '/img/samples/color_red.gif ')
  img(:first_child_less_than_allocated, :src=> '/resource/color_blue')
  img(:first_child_equal_to_allocated, :src=> '/img/samples/color_green.gif ')


  select_list(:divisions, :xpath => "html/body/div[1]/div[2]/table/tbody/tr/td[2]/form/div[2]/div/div/div/div[2]/table[2]/tbody/tr/td[2]/select")
  text_field(:user_name, :id => "j_id0:frm:pblk:opptable:0:j_id65")
  text_field(:child_opportunity_name,:id=>'j_id0:frm:pblk:opptable:0:j_id61')

  div(:division_exp,:id=>'00NE0000005T8qY_ileinner')
  select_list(:child_opportunity_type,:id=>'j_id0:frm:pblk:opptable:0:j_id67')
# Name: form_field_order
# Input: No input is needed.
# Purpose: Fills the details of the various fields in required order

  def form_field_order
    %w{

      owner
      budget_amount
      save_button


    }
  end

# Name: data_class
# Input:  No input is needed.
# Purpose: Return the data class for the page

  def self.data_class
    SalesforceMpBudgetAllocationPageData
  end

# Name: page_title_validation_value
# Input: none
# Purpose: return the validation value for the page title

  def self.page_title_validation_value
    /Multiplatform Deal Details/
  end

# Name: page_url_validation_value
# Input: none
# Purpose: return the validation value for the page url

  def self.page_url_validation_value
    /ManageBudgetAllocation/
  end

end





