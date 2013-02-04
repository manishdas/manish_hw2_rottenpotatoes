module ApplicationHelper
  def th_sortable(column, title=nil, opts={})
    title ||= column.titleize
    class_name = sort_column == column ? 'hilite' : ''
    content_tag(:th, { :class => class_name }) do
      link_to title, params.merge({ :sort => column }), opts
    end
  end
end
