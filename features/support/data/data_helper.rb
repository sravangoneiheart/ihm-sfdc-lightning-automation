include YmlUtilities

module DataHelper

  # Name: grp_environment_url
  # Input: No input is needed.
  # Purpose: Returns the url of the environment

  def salesforce_environment_url

    url = get_data_from_yml_file("environment_urls.yml")["SALESFORCE_" + application_environment]
    p url
    raise "Unknown Environment: \"#{application_environment}\"" unless url
    url
  end

  # Name: grp_environment_url
  # Input: No input is needed.
  # Purpose: Returns the url of the environment

  # def bms_environment_url
  #   url = get_data_from_yml_file("environment_urls.yml")["BMS_" + application_environment]
  #   raise "Unknown Environment: \"#{application_environment}\"" unless url
  #   url
  # end
  #
  # def bms_environment_order_id_url
  #   url = get_data_from_yml_file("environment_urls.yml")["BMS_" + "#{application_environment}_ORDER_ID"]
  #   raise "Unknown Environment: \"#{application_environment}\"" unless url
  #   url
  # end

  # Name: login_url
  # Input: No input is needed.
  # Purpose: Returns the url of the Login page

  def login_url
    environment_url + get_data_from_yml_file("environment_urls.yml")["LOGIN_URL"]
  end

  # Name: base_url
  # Input: No input is needed.
  # Purpose: Returns the environments base url

  def base_url
    get_data_from_yml_file("environment_urls.yml")["#{application_environment}_BASE_URL"]
  end

  # Name: application_environment
  # Input: No input is needed.
  # Purpose: Returns the name of the environment (e.g. - IT, Dev)

  def application_environment
    ENV['app_env'].nil? ? "QA" : ENV['app_env'].gsub(" ","_").upcase
  end

  # Name: database_host
  # Input: No input is needed.
  # Purpose: Returns the host information for the environment

  def database_host
    get_data_from_yml_file("database_credentials.yml")[application_environment.upcase]["HOST"]
  end

  # Name: database_name
  # Input: No input is needed.
  # Purpose: Returns the database information for the environment

  def database_name
      get_data_from_yml_file("database_credentials.yml")[application_environment.upcase]["DATABASE"]
  end

  # Name: database_login
  # Input: No input is needed.
  # Purpose: Returns the login information for the environment

  def database_login
    get_data_from_yml_file("database_credentials.yml")[application_environment.upcase]["USERNAME"]
  end

  # Name: database_password
  # Input: No input is needed.
  # Purpose: Returns the password for the environment

  def database_password
    get_data_from_yml_file("database_credentials.yml")[application_environment.upcase]["PASSWORD"]
  end

  # Name: environment_browser_type
  # Input: No input is needed.
  # Purpose: Returns the browser to be used

  def environment_browser_type
    ENV['browser_type'].nil? ? "firefox" : ENV['browser_type']
  end

  # Name: close_browser_when_finished
  # Input: No input is needed.
  # Purpose: Returns whether the browser must be used after the test is finished

  def close_browser_when_finished
    ENV['close_browser'].nil? ? false : ENV['close_browser'] == "true"
  end

  # Name: verbose
  # Input: No input is needed.
  # Purpose: Returns wether or not to print out messages for what is happening under the hood

  def verbose_messages
    ENV['verbose'].nil? ? false : ENV['verbose'] == "true"
  end

end

World DataHelper