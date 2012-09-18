class FileInput < SimpleForm::Inputs::FileInput
  def input
    html = ""
    if object.send("#{attribute_name}?")
      template.content_tag :div, :class => "file flippable" do
        html += template.content_tag :div, :class => "pinable hoverable flipdown span3" do 
          template.image_tag(object.send(attribute_name).url) + 
          template.my_link_to("#{I18n.t(:'actions.change')}", "#", 
                              :class => "btn btn-info pin-top-right show-on-hover on-click",
                              :icon => "icon-pencil")
        end 
        html += template.content_tag :div, :class => "flipup" do
          if placeholder = options.delete(:remote_url)
            remote_url_name = "remote_" + attribute_name.to_s + "_url"
            super + "<span> #{I18n.t('simple_form.or')} </span>".html_safe + 
                @builder.text_field(remote_url_name, :placeholder => placeholder)
          else
            super
          end
        end
        html.html_safe
      end
    else
      if placeholder = options.delete(:remote_url)
        remote_url_name = "remote_" + attribute_name.to_s + "_url"
        super + "<span> #{I18n.t('simple_form.or')} </span>".html_safe + 
            @builder.text_field(remote_url_name, :placeholder => placeholder)
      else
        super
      end
    end
  end
end
