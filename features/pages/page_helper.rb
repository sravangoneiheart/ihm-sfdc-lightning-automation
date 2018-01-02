module PageHelper

  def page_class_name_for(page_name)
    p page_name if verbose_messages
    Kernel.const_get(page_name.split(" ").collect { |a| (a =~ /BMS|GRP|TTWN/i ? a.upcase : a.capitalize ) }.join("") + "Page")
  end

  def popup_class_name_for(popup_name)
    p popup_name if verbose_messages
    Kernel.const_get(popup_name.gsub(" ", "") + "Popup")
  end

  def application_is_on_page?(page_names)
    p "going to #{page_names} page"

    page_name_array = page_names.split(" or ")
    page_correct = false

    page_name_array.each do |page_name|
      page_name = page_name.split(' ').map {|w| w.capitalize }.join(' ')

      on_page(page_class_name_for(page_name))

      2.times do |x|
        begin
          Watir::Wait.until(15) {@browser_session.return_page_load_state}
          Watir::Wait.until(15) {@current_page.anchor_element.exists?} if page_names == "salesforce setup search results"
          break
        rescue Net::ReadTimeout =>  e
          puts e.message
          @browser.refresh
          next
        end
      end

      if @current_page.page_title_is_correct and @current_page.page_url_is_correct
        page_correct = true
        break
      end
    end
    page_correct
  end

  def keep_trying_to_set(times_to_retry = 10)
    times_to_retry.to_i.times {
      begin
        yield
        return
      rescue Exception => e
        p e

      end
    }
  end

  def keep_trying_to_navigate(times_to_retry = 10)
    error = nil

    times_to_retry.to_i.times {
      begin
        yield
        return
      rescue Exception => e
        p e
        error = e
        @browser.refresh
        next
      end
    }
   # raise error
  end

end

World PageHelper