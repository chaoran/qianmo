class StringInput < SimpleForm::Inputs::StringInput
  def input
    if extra_button = options.delete(:extra_button)
      name = extra_button[0]
      url = extra_button[1]
      styles = extra_button[2] if extra_button.length > 2
      html = super + " "
      if styles.nil?
        html += template.link_to name, url
      else
        html += template.link_to name, url, styles
      end
    else
      super
    end
  end
end
