class DetailsScreen < PM::Screen
  attr_accessor :venue_name
  attr_accessor :venue_id

  title " "
  stylesheet DetailsScreenStylesheet

  def on_init
    set_nav_bar_button :back, title: 'Cancel', style: :plain, action: :back
    self.title = venue_name
  end

  def on_load
    # set_nav_bar_button :back, title: 'Cancel', style: :plain, action: :back
    # self.title = venue_name
    # set_nav_bar_button :back, title: 'Back', style: :plain, action: :back
    get_details

    @counter = append!(UILabel, :counter)
    @venuename = append!(UILabel, :venuename)
    # @sample_image = append!(UIImageView, :sample_image)
  end
  
  def get_details
    CounterAPI.new.details(venue_id) do |response|
      p response
      if response.kind_of?(Hash)
        @counter.text = response["counter"].to_s
        @venuename.text = response["name"].to_s
        # @sample_image.remote_image = "http://www.ororadio.com.mx/noticias/wp-content/uploads/2015/06/Guelaguetza-650x330.jpg"
        p "@counter.text = #{response["counter"].to_s}"
        p "@venue_name.text = #{response["name"].to_s}"

      else 
        app.alert(title: "Something Went Wrong", message: response)
      end
    end
  end

  def show_access()
    @name = append!(UILabel, :name)

  end


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
