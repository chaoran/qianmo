module PagesHelper
  def hidden_edit_button(element, path)
    content_tag :div, :id => "page_#{element}_edit", 
                      :class => "page-hidden-button", 
                      :style => "display: none;" do
      small_edit_button path, :remote => :true
    end
  end
end
