class DetailsScreen < PM::Screen
  attr_accessor :venue_name
  attr_accessor :venue_id

  title " "
  stylesheet DetailsScreenStylesheet

  def on_init
    self.title = venue_name
  end

  def on_back
    timerStop
  end

  def timerFired
    get_details
  end

  def on_load
    venue_id ? details_template : hello_template
    # venue_id ? get_details : hello
  end

  def will_appear
    reapply_styles
  end

  def hello_template
    @welcome = append!(UILabel, :welcome)
    @description = append!(UILabel, :description)
  end

  def details_template
    @counter = append!(UILabel, :counter)
    @venuename = append!(UILabel, :venuename)
    @chart_view = append!(UIView, :chart_view)
    get_details
  end
  
  def get_details
    CounterAPI.new.details(venue_id) do |response|
      # p response
      if response.kind_of?(Hash)
        @counter.text = response["counter"].to_s
        @venuename.text = response["name"].to_s
        # @sample_image.remote_image = "http://www.ororadio.com.mx/noticias/wp-content/uploads/2015/06/Guelaguetza-650x330.jpg"
        p "@counter.text = #{response["counter"].to_s}"
        p "@venue_name.text = #{response["name"].to_s}"
        add_chart(Hash[response["histories12hrs"].sort_by{|k,v| v}]) unless @view
        @timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: 'timerFired', userInfo: nil, repeats: false)
      else 
        timerStop
        close_screen
      end
    end
  end

  def will_disappear
    timerStop
  end

  def timerStop
    if @timer
      @timer.invalidate
      @timer.release
      @timer = nil    
    end
  end

  def show_access()
    @name = append!(UILabel, :name)
  end


  def add_chart(items_array)

    options = {
      title: {
        text: "Úlimas 12 horas",
        color: 'FFFFFF',
        font_name: "Arial"
      },
      curve_inerpolation: true,
      # orientation: "vertical",
      theme: MotionPlot::Theme.dark_gradient,
      xAxis: {
        title: {
          text: 'Tiempo (Hrs)',
          color: "FFFFFF",
          font_name: "Arial",
          offset: 30.0
        },
        enabled: true,
        color: '808080',
        labels: [''],
        style: {
          color: "FFFFFF",
          font_name: "Arial",
          font_size: 10
        }
      },
      plot_symbol: {
        enabled: true,
        size: 8
      },
      data_label: {
        color: "FFFFFF",
        font_size: 10,
        font_name: "Arial",
        displacement: [0, 10]
      },
      yAxis: {
        title: {
          text: 'Personas',
          color: "FFFFFF",
          font_name: "Arial",
          offset: 30.0
        },
        style: {
          color: "FFFFFF",
          font_name: "Arial",
          font_size: 10
        },
        enabled: true
      },
      legend: {
        enabled: false
      },
      series: [{
        name: '',
        data: items_array.values,
        color: "173B0B"
      }]
    }
    @view = MotionPlot::Area.alloc.initWithOptions(options, containerView:@chart_view)
    @chart_view.addSubview(@view)
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
