class SalesforceCloneProposalPage < WebPage


  label(:valid_opportunities_label,:xpath => "//*[@id='j_id0:dupForm:dupBlock:mainTable']/div[2]/table/tbody/tr[2]/th/label")
  select_list(:valid_opportunities,:xpath => "//*[@id='j_id0:dupForm:dupBlock:mainTable:dupBlockSectionOpp:idValidOpps']")
  text_field(:clone_proposal_name,:id=>'j_id0:dupForm:dupBlock:mainTable:dupBlockSection:idPropName')
  button(:clone, :id => "j_id0:dupForm:dupBlock:j_id29:bottom:btnDuplicate")

  # Name: form_field_order
  # Input: No input is needed.
  # Purpose: Fills the details of the various fields in required order

  def form_field_order
    %w{
        username
        password
    }
  end

  # Name: data_class
  # Input:  No input is needed.
  # Purpose: Return the data class for the page

  def self.data_class
    SalesforceCloneProposalData
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
    /rf_DuplicateProposal/
  end

end





