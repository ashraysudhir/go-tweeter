module ApplicationHelper
  def home_title(title = '')
    root_title = "Go-Tweeter"
    if(title.empty?)
      root_title
    else
      title + " | " + root_title
    end
  end
end
