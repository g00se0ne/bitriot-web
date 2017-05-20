require 'open-uri'

module ApplicationHelper
  def selected_if_true(truthy)
    if truthy
      'selected'
    else
      ''
    end
  end

  def inline_svg(path)
    begin
      open(path) do |file|
        raw file.read
      end
    rescue Exception => e
      image_tag path
    end
  end
end
