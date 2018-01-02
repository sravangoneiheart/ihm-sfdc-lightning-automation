class SalesforceTTWNOrderReviewPage < WebPage



  button(:new_order_line_button, :value => "New Order Line")
  link(:assign_address_link, :text => "Assign Address")
    checkbox(:the_first_address_in_the_table, :class => "chk")
    button(:save_button, :value => "Save")

  #Opportunity Information Section
  span(:opportunity, :id => "pg:form1:orderDetails:j_id78:j_id79")

  text_area(:special_billing_instructions, :id => "j_id0:frm:pgBlk:infoSect:billingInstr")

  #Submit for Approval
  button(:submit_for_approval_button, :value => "Submit for Approval")
  link(:first_approval_link_in_the_approval_table, :text => "Approve / Reject")

  #Subbu 08/05/2016 - Element for Order id
  span(:order_id, :id => "pg:j_id17")

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
    SalesforceTTWNOrderReviewPageData
  end

  # Name: page_title_validation_value
  # Input: none
  # Purpose: return the validation value for the page title

  def self.page_title_validation_value
    /SPONSORSHIP ORDER AGREEMENT/
  end

  # Name: page_url_validation_value
  # Input: none
  # Purpose: return the validation value for the page url

  def self.page_url_validation_value
    /TTNOrder?/
  end

end





