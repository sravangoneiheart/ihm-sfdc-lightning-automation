class SalesforceDeletePage < WebPage
   
  radio_button(:check_field, :id => "ReplaceValueWithNullValue")
  button(:save, :name => "delID")
  
  def form_field_order
    %w{

    }
  end

  def self.data_class
    SalesforceDeletePageData
  end
  
  def self.page_title_validation_value
    /Field Information/
  end
   
  def self.page_url_validation_value
      #Subbu - escape sequence not used for ?
      #/001\/e?retURL=/
      #/001\/e\?retURL=/
      #Subbu - 08/15/16 - changing values to accommodate new and edit page
    /salesforce.com/
  end
  
end





