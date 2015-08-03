class AppDelegate < PM::Delegate

  status_bar true, animation: :fade

  def on_load(app, options)
    if device.ipad?
      open_split_screen VenuesScreen.new(nav_bar: true), DetailsScreen.new(nav_bar: true)
    else
      open VenuesScreen.new(nav_bar: true)
    end
    # open VenuesScreen.new(nav_bar: true)
  end

  # Remove this if you are only supporting portrait
  def application(application, willChangeStatusBarOrientation: new_orientation, duration: duration)
    # Manually set RMQ's orientation before the device is actually oriented
    # So that we can do stuff like style views before the rotation begins
    device.orientation = new_orientation
  end
end
