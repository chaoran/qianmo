module PagesHelper
  def hidden_edit_button(element, path)
    content_tag :div, :id => "page_#{element}_edit", 
                      :class => "page-hidden-button", 
                      :style => "display: none;" do
      small_edit_button path, :remote => :true
    end
  end
  
  def page_section(name, editable, &block)
    if controller.action_name == "new" || @page.send("has_" + name)
      content_tag :div, :class => "#{name}_section", :class => "pinable hoverable" do 
        html = ""
        html << my_link_to("#{t :edit}", edit_page_path(@page, :component => name), 
                           :icon => "icon-pencil", :remote => true,
                           :class => "show-on-hover pin-top-right btn")
        html << capture(&block)
      end
    end
  end
end
