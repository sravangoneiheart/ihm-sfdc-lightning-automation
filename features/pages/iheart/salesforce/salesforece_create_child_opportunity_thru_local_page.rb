class SalesforceCreateChildOpportunityThruLocalPage < WebPage

button(:add_row_button, :id => 'j_id0:frm:j_id4:addChildBlkSection:j_id44:j_id45:j_id46')
text_field(:opportunity_description_1, :id => 'j_id0:frm:j_id4:addChildBlkSection:j_id44:j_id48:0:j_id56')
text_field(:opportunity_description_2, :id => 'j_id0:frm:j_id4:addChildBlkSection:j_id44:j_id48:1:j_id56')
button(:save_button, :id => 'j_id0:frm:j_id4:pblkbtn:j_id5')
button(:cancel_button, :name => 'j_id0:frm:j_id4:pblkbtn:j_id6')
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
    SalesforceCreateChildOpportunityThruLocalPageData
  end

# Name: page_title_validation_value
# Input: none
# Purpose: return the validation value for the page title

  def self.page_title_validation_value
    /Create Child Opportunities/
  end

# Name: page_url_validation_value
# Input: none
# Purpose: return the validation value for the page url

  def self.page_url_validation_value
    //
  end

end





