# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  # Método para ordernar las columnas de una tabla
  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    dir = sort_direction
    direction = column == sort_column && dir.to_s == "desc".to_s ? "asc" : "desc"
    link_to title + " #{direction}", {:direction => direction, :sort => column},  {:class => css_class}
  end
end
