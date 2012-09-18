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
  
  def page_intro_preview(content)
    content = "&nbsp;&nbsp;&nbsp;&nbsp;" + content.gsub("\r\n", "<br />&nbsp;&nbsp;&nbsp;&nbsp;")
    if content.length > 600
      preview_content = content[0..400] + "..."
      html = content_tag :div, :class => "flippable" do 
        h = content_tag :p, :class => "flipdown" do
          content[0..400].html_safe + "... " + link_to("#{I18n.t "actions.expand"}", "#", :class => "on-click")
        end
        h += content_tag :p, :class => "flipup" do
          content.html_safe + " " + link_to("#{I18n.t "actions.collapse"}", "#", :class => "on-click")
        end
      end
    else
      html = content_tag :p do
        content
      end
    end
    html.html_safe
  end
end
