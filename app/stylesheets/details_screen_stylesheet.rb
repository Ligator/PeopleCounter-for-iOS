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
    st.frame = {t: 70, w: 400, h: 150, centered: :horizontal}
    st.text_alignment = :center
    st.color = color.black
    # st.background_color = color.blue
    # font.add_named :large, font_family, 100
    st.font = font.system(124)
    # st.font = font.very_large
    # st.font = font.large
    # st.text = '1234'
  end

  def venuename(st)
    st.frame = {t: 220, w: 300, h: 60, centered: :horizontal}
    st.text_alignment = :center
    st.color = color.battleship_gray
    # st.background_color = color.red
	# st.text = ''
    st.font = font.system(25)
    st.number_of_lines = 0
    # st.frame = {t: 250, w: 300, h: 50, centered: :horizontal}
    # st.resize_to_fit_text
    # st.size_to_fit
  end

	# def sample_image(st)
	#   st.frame = {left: 20, below_prev: 10, from_right: 20, from_bottom: 20}
	#   st.background_color = color.gray

	#   # an example of using the view directly
	#   st.view.contentMode = UIViewContentModeScaleAspectFit
	# end
  
end
