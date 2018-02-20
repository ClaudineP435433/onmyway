module ApplicationHelper

  def delivery_color_status(status)
    if status == "done"
      'c-green'
    elsif status == 'in progress'
      'c-blue'
    else
      'c-orange'
    end
  end
end
