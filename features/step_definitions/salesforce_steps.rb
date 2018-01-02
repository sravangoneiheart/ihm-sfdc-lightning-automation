When /^the user selects (.+) from the (.+) table$/ do |page_element, table|
  Watir::Wait.until(10) {@current_page.send(table.gsub(" ","_").downcase + "_table_element").exists?}
#  @current_page.send(table.gsub(" ", "_").downcase + "_table_element")["#{page_element}"][0].click  ####this works but only selects the cell in the first column

  #Important Notes:
  #You must name the TABLE in the step so that ["YOUR TABLE NAME" + " Name"] (i.e. "Opportunity Name")
  #corresponds to the column header in SF of the table from which you are clicking the element
  ####Example - clicking an Opportunity in SF table, the link to select the Opportunity will be under the "Opportunity Name" column header
  #### so you must name your table "opportunity table" for this step def to work - see a  table in Salesforce if you don't understand
  @current_page.send(table.gsub(" ", "_").downcase + "_table_element")["#{page_element}"]["#{table.capitalize}" + " Name"].link.click
end

When /^the user logs into Salesforce as a (.*) user$/ do |user_type|
    step "the user clicks the username menu dropdown"
    step "the user clicks the setup link"
    step "the application navigates to the salesforce setup page"
    step "the user fills the salesforce setup page with #{user_type}"
    step "the user clicks the setup search button"
    step "the application navigates to the salesforce setup search results page"
    step "the user clicks the name link"
    step "the application navigates to the salesforce user detail page"
    step "the user clicks the login button"
    step "the application navigates to the Salesforce Home page"
end

When /^the user log into Salesforce as a (.*) network user$/ do |user_type|
  step "the user clicks the username menu dropdown"
  step "the user clicks the setup link"
  step "the application navigates to the salesforce setup page"
  step "the user fills the salesforce setup page with #{user_type}"
  step "the user clicks the setup search button"
  step "the application navigates to the salesforce setup search results page"
  step "the user clicks the name link"
  step "the application navigates to the salesforce user detail page"

end

When /^the user logs into Salesforce as a (.*) inquiry user$/ do |user_type|
  step "the user clicks the username menu dropdown"
  step "the user clicks the setup link"
  step "the application navigates to the salesforce setup page"
  step "the user fills the salesforce setup page with #{user_type}"
  step "the user clicks the setup search button"
  step "the application navigates to the salesforce setup search results page"
  step "the user clicks the name link"
  step "the application navigates to the salesforce user detail page"
  step "the user clicks the login button"
end


When /^the user goes to the particular opportunity url$/ do
  @browser.goto($captured_url)
end

When /^the user selects "(.+)" from the (Formats|Controversial|Services|Holidays) tab of the exclusions window(?: by (Program|Station))?$/ do |exclusion, type, exclude_by|
  case type
    when /Formats/i
      step "the user clicks the formats tab"
      step "the user fills in \"#{exclusion}\" for formats search field"
      step "the user clicks the first format in the format exclusions table"
    when /Controversial/i
      step "the user clicks the controversial tab"
      @current_page.controversial_exclusions_table_element["#{exclusion}"][0].click
      #Subbu
      #if exclude_by == /Program/i
        if exclude_by == "Program"
         step "the user clicks the program button"
        end
      #Subbu
      #if exclude_by == /Station/i
      if exclude_by == "Station"
       step "the user clicks the station button"
      end
    when /Services/i
      step "the user clicks the services tab"
      step "the user fills in \"#{exclusion}\" for services search field"
      step "the user clicks the first row in the service exclusions table"
    when /Holidays/i
      step "the user clicks the holidays tab"
      step "the user fills in \"#{exclusion}\" for holidays search field"
      step "the user clicks the first row in the holiday exclusions table"
  end
end

When /^the logged in user provides approval$/ do
  step "the user navigates to the captured URL"
  step "the application navigates to the salesforce individual opportunity page"
  step "the user clicks the first approval link in the approval table"
  step "the application navigates to the Salesforce approval request page"
  step "the user clicks the approve button"
  step "the application navigates to the Salesforce individual opportunity page"
end

When /^the user logs out of Salesforce$/ do
  step "the user clicks the username menu dropdown"
  step "the user clicks the logout link"
end

When /^the new billing address exists on the Account record in Salesforce$/ do
  @browser.td(:text => SalesforceNewBillingAddressPage.class_eval("@@address1")).exists?
  @browser.td(:text => SalesforceNewBillingAddressPage.class_eval("@@city")).exists?
  @browser.td(:text => SalesforceNewBillingAddressPage.class_eval("@@state_province")).exists?
  @browser.td(:text => SalesforceNewBillingAddressPage.class_eval("@@zip_postal_code")).exists?
end

When /^the user deletes the recently created (billing address|account)$/ do |table|
  Watir::Wait.until(10) {@current_page.send(table.gsub(" ","_").downcase + "_table_element").exists?}
  @current_page.send(table.gsub(" ", "_").downcase + "_table_element")["Not Verified"]["View"].link.click
  step "the user views the page"
  step "the user clicks the delete button"
  step "the user views the page again"
  step "the user confirms on the alert box"
end

And(/^the user verifies the user profile where role (.*) with (.*) and profile (.*) with (.*) and home market (.*) with financial (.*) and division (.*) and with operating (.*)$/) do |role_value,role,profile_Value,profile,home_market_value,market,division,operating|
  $role = @current_page.send(role_value.gsub(" ","_").downcase + '_element').text
  p $role

  if($role == role)
    $profile = @current_page.send(profile_Value.gsub(" ","_").downcase+ '_element').text
    p $profile
  else
    role2 = '"'+role+'"'
    p role2

    step "the user clicks the edit button"
    step "the user selects #{role2} for role"
    step "the user views the page"
    step "the user views the page"
    step "the user views the page"
    step "the user clicks the save button"
  end

  if($profile == profile)
    $market = @current_page.send(home_market_value.gsub(" ","_").downcase+ '_element').text
    p $market
  else
    profile2 = '"'+profile+'"'
    p profile2
    step "the user clicks the edit button"
    step "the user selects #{profile2} for profile"
    step "the user views the page"
    step "the user views the page"
    step "the user views the page"
    step "the user clicks the save button"
  end
  if($market == market)

  else
    market2 = '"'+market+'"'
    p market2
    division2 = '"'+division+'"'
    p division2
    operating2 = '"'+operating+'"'
    p operating2
    step "the user clicks the market"
    step "the user selects #{market2} for f market"
    step "the user views the page"
    step "the user selects #{division2} for division"
    step "the user fills in #{operating2} for operating"
    step "the user clicks the save market"
  end
end
