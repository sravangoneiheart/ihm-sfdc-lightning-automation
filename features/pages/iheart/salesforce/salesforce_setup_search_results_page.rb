class SalesforceSetupSearchResultsPage < WebPage

  table(:anchor, :xpath => "//div[@class='searchResult']/table") #NEVER delete this anchor element (same as "search_results_table" element below)

  table(:search_results_table, :xpath => "//div[@class='searchResult']/table")
  link(:name_link){
    search_results_table_element[1][1].link_element
  }


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
    SalesforceSetupSearchResultsPageData
  end

  # Name: page_title_validation_value
  # Input: none
  # Purpose: return the validation value for the page title

  def self.page_title_validation_value
    /Setup Search Results/
  end

  # Name: page_url_validation_value
  # Input: none
  # Purpose: return the validation value for the page url

  def self.page_url_validation_value
    /SetupSearchResultsPage/
  end

end





