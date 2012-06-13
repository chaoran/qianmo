module SimpleFormExtensions
  def wrapped_button(*args, &block)
    template.content_tag :div, :class => "form-actions" do
      options = args.extract_options!
      loading = self.object.new_record? ? I18n.t('simple_form.creating') : I18n.t('simple_form.updating')
      options[:"data-loading-text"] = [loading, options[:"data-loading-text"]].compact
      options[:class] = ['btn-primary', options[:class]].compact
      args << options
      if cancel = options.delete(:cancel)
        submit(*args, &block) + ' ' + template.link_to(template.button_tag(I18n.t('simple_form.buttons.cancel'), :type => "button", :class => "btn"), cancel)
      else
        submit(*args, &block)
      end
    end
  end
  
  class ErrorMessages < SimpleForm::ErrorNotification
    def error_message
      template.content_tag :ul do
        object.errors.map do |key, value|
          template.content_tag(:li, value)
        end.join.html_safe
      end
    end
  end
  
  def error_messages(options={})
    ErrorMessages.new(self, options).render
  end
end

SimpleForm::FormBuilder.send :include, SimpleFormExtensions