module PublicHelper
  def page_title(title=nil)
    site_title = Admin::BasicSetting.first.try(:title) || 'Boostbase'
    if title.blank?
      site_title
    else
      title + " | " + site_title
    end
  end

  def page_description(description=nil)
    site_description = Admin::BasicSetting.first.try(:description) || ''
    if description.blank?
      site_description
    else
      description
    end
  end
end
