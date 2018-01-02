class SalesforceIndividualAccountPage < WebPage


    #Subbu 08/15/16 - adding missing elements

    button(:request_access,:xpath=>"//*[@id='topButtonRow']/input[@value='Request Access']")
    link(:request_access_1,:xpath=>"//*[@id='pg:frm:resultBlock:j_id81:0:j_id82']/a")
    link(:close_activity_1,:xpath=>"html/body/div[1]/div[2]/table/tbody/tr/td[2]/div[15]/div[1]/div/div[2]/table/tbody/tr[2]/td[1]/a[2]")
#***************Riaze_Charlotte






















    #span(:accounts_market_link, :text => "AccountMarkets")

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
    SalesforceIndividualAccountPageData
  end

  # Name: page_title_validation_value
  # Input: none
  # Purpose: return the validation value for the page title

  def self.page_title_validation_value
    /Account Detail|Smart Account Search/
  end

  # Name: page_url_validation_value
  # Input: none
  # Purpose: return the validation value for the page url

  def self.page_url_validation_value
    //  #unfortunately the URLs for individual account pages are dynamic, so a unique URL for validation does not exist
  end



  #******************* Added By Riaze_Charlotte

    #**********************************************************************
    # Name:
    # Input: none
    # Purpose: methods to get the data from DB KUND
    #**********************************************************************

  def query_adv_account(i)
      sleep 1
      temp_results_array = $captured_results['sfdcid'].split(',')
      db_reuslts = ''
      sql = "select * from kund where SFDCID = " + "'" + temp_results_array[i] + "'"
      p sql
      #sql = "select * from kund where NAMN = 'TestAcc20170519160421'"
      reuslts = ActiveRecord::Base.connection.select_all(sql)
      reuslts.each do |row|
        db_reuslts = row
      end
      puts db_reuslts
      return db_reuslts
  end

    def query_agc_account(i)
      sleep 1
      temp_results_array = $captured_results['sfdcid'].split(',')
      db_reuslts = ''
      sql = "SELECT * FROM SALES_REP WHERE SFDCID = " + "'" + temp_results_array[i] + "'"
      p sql
      #sql = "select * from kund where NAMN = 'TestAcc20170519160421'"
      reuslts = ActiveRecord::Base.connection.select_all(sql)
      reuslts.each do |row|
        db_reuslts = row
      end
      puts db_reuslts
      return db_reuslts
    end

    def query_adv_billing_address(i)
      sleep 5
      temp_results_array = $captured_results['billing_sfdc'].split(',')
      db_reuslts = ''
      sql = "select * from AdvertiserAddress where SfdcID = " + "'" + temp_results_array[i]+ "'"
      p sql
      #sql = "select * from kund where NAMN = 'TestAcc20170519160421'"
      reuslts = ActiveRecord::Base.connection.select_all(sql)
      reuslts.each do |row|
        db_reuslts = row
      end
      puts db_reuslts
      return db_reuslts
    end

    def query_agc_billing_address(i)
      sleep 5
      temp_results_array = $captured_results['billing_sfdc'].split(',')
      db_reuslts = ''
      sql = "SELECT * FROM AGENCYADDRESS WHERE SFDCID = " + "'" + temp_results_array[i] + "'"
      p sql
      #sql = "select * from kund where NAMN = 'TestAcc20170519160421'"
      reuslts = ActiveRecord::Base.connection.select_all(sql)
      reuslts.each do |row|
        db_reuslts = row
      end
      puts db_reuslts
      return db_reuslts
    end
end





