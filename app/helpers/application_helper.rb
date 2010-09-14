# Methods added to this helper will be available to all templates in the application.

# You can extend refinery with your own functions here and they will likely not get overriden in an update.
module ApplicationHelper
  include Refinery::ApplicationHelper # leave this line in to include all of Refinery's core helper methods.


  def breadcrumbs(page=@page)
    return [Page.find_by_link_url('/')] if page.nil?
    breadcrumbs(page.parent) << page
  end

  def logo(page=@page)
    return Page.find_by_link_url('/')[:logo] if page.nil?
    return page[:logo] unless page[:logo].nil?
    logo(page.parent)
  end
end
