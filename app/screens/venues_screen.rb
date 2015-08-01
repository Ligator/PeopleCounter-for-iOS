class VenuesScreen < PM::TableScreen
  title "Lugares"
  refreshable
  stylesheet VenuesScreenStylesheet

  def on_load
    @table_data ||= []
    get_venues
  end
  
  def table_data
    [{
      cells: @table_data
    }]
  end

  def on_refresh
    get_venues
  end

  def get_venues
    CounterAPI.new.venues do |response|
      p response
      if response.kind_of?(Array) and response == []
        @table_data = NO_RESULTS_FOUND
      elsif response.kind_of?(Array)
        @table_data = response.map do |venue|
          {
            title: venue["name"].to_s,
            subtitle: venue["counter"].to_s + " Personas" ,
            action: :tap_headline,
            arguments: { id: venue["id"], name: venue["name"] }
          }
        end
      else 
        app.alert("Something Went Wrong"+response)
      end
      stop_refreshing
      update_table_data      
    end
  end

  def tap_headline
  end

  # def get_venues
  #   App.shared.setNetworkActivityIndicatorVisible true
  #   CounterAPI.new.venues do |response|
  #     App.shared.setNetworkActivityIndicatorVisible false
  #     if response.success?

  #     else
  #       if response.operation.response == nil
  #         status = ""
  #       else
  #         status = ": " + response.status_code.to_s
  #       end
  #       app.alert("Something Went Wrong"+status + response.error.localizedDescription)
  #       []
  #     end
  #   end
  # end
  

  # You don't have to reapply styles to all UIViews, if you want to optimize, another way to do it
  # is tag the views you need to restyle in your stylesheet, then only reapply the tagged views, like so:
  #   def logo(st)
  #     st.frame = {t: 10, w: 200, h: 96}
  #     st.centered = :horizontal
  #     st.image = image.resource('logo')
  #     st.tag(:reapply_style)
  #   end
  #
  # Then in will_animate_rotate
  #   find(:reapply_style).reapply_styles#

  # Remove the following if you're only using portrait
  def will_animate_rotate(orientation, duration)
    reapply_styles
  end
end
