class DetailsScreenStylesheet < ApplicationStylesheet
  # Add your view stylesheets here. You can then override styles if needed,
  # example: include FooStylesheet

  def setup
    # Add stylesheet specific setup stuff here.
    # Add application specific setup stuff in application_stylesheet.rb
  end

  def root_view(st)
    st.background_color = color.white
  end

  def counter(st)
    st.frame = {t: device.ipad? ? 100 : 70, w: 400, h: 150, centered: :horizontal}
    st.text_alignment = :center
    st.color = color.black
    # st.background_color = color.blue
    # font.add_named :large, font_family, 100
    st.font = device.ipad? ? font.system(160) : font.system(124)
    # st.font = font.very_large
    # st.font = font.large
    # st.text = '1234'
  end

  def venuename(st)
    st.frame = {bp: 20, w: device.ipad? ? 500 : 300, h: device.ipad? ? 100 : 70, centered: :horizontal}
    st.text_alignment = :center
    st.color = color.battleship_gray
    # st.background_color = color.white
  # st.text = ''
    st.font = device.ipad? ? font.system(40) : font.system(25)
    st.number_of_lines = 0
    # st.frame = {t: 250, w: 300, h: 50, centered: :horizontal}
    # st.resize_to_fit_text
    # st.size_to_fit
  end

  def chart_view(st)
    st.frame = {bp: 20, w: device.ipad? ? device.width-100 : device.width, h: device.ipad? ? 300 : 200, centered: :horizontal}
    # st.frame = {t: 300, w: 300, h: 200, centered: :horizontal}
    # st.background_color = color.battleship_gray
  end

  def welcome(st)
    st.frame = {t: 200, w: device.ipad? ? 600 : 300, h: device.ipad? ? 150 : 70, centered: :horizontal}
    st.text_alignment = :center
    st.color = color.battleship_gray
    st.text = '¡Bienvenido!'
    st.font = device.ipad? ? font.system(100) : font.system(25)
    st.number_of_lines = 0
  end

  def description(st)
    st.frame = {bp: 80, w: device.ipad? ? 600 : 300, h: device.ipad? ? 100 : 70, centered: :horizontal}
    st.text_alignment = :center
    st.color = color.battleship_gray
    st.text = 'Selecciona un "Lugar" del menú para mostrar los detalles'
    st.font = device.ipad? ? font.system(40) : font.system(25)
    st.number_of_lines = 0
  end


	# def sample_image(st)
	#   st.frame = {left: 20, below_prev: 10, from_right: 20, from_bottom: 20}
	#   st.background_color = color.gray

	#   # an example of using the view directly
	#   st.view.contentMode = UIViewContentModeScaleAspectFit
	# end

end
