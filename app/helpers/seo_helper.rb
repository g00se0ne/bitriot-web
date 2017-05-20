module SeoHelper
  def application_title(app_name:, separator:)
    title = content_for(:page_title)
    full_title = content_for(:full_page_title)

    if full_title
      full_title
    elsif content_for(:page_title_reverse) == true
      [app_name, title].reverse.compact.join(separator)
    else
      [app_name, title].compact.join(separator)
    end
  end

  def page_title(options = {})
    content_for(:page_title_reverse, true) if options[:reverse]
    content_for(:page_title, options[:page_title]) if options[:page_title]
    content_for(:full_page_title, options[:full_page_title]) if options[:full_page_title]
  end

  def og_title
    if content_for(:og_title)
      content_for(:og_title)
    elsif content_for(:page_title)
      content_for(:page_title)
    elsif content_for(:full_page_title)
      content_for(:full_title)
    elsif content_for(controller.controller_name.humanize)
    end
  end

  def og_image
    if content_for(:og_image)
      content_for(:og_image)
    else
      asset_url('gfx-fb-og.jpg')
    end
  end

  def og_description
    if content_for(:og_description)
      content_for(:og_description)
    else
      description
    end
  end

  def description
    if content_for(:description)
      content_for(:description)
    else
      'Bit Riot is a Ruby on Rails, JavaScript, Elixir and mobile design / development consultancy. '
    end
  end

  def duns
    '087822293'
  end

  def founder
    'Josh Vandergrift'
  end

  def foundingDate
    '04/15/2015'
  end
end
