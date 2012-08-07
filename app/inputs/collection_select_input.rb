class CollectionSelectInput < SimpleForm::Inputs::CollectionSelectInput
  def input
    if placeholder = options.delete(:new_text_field)
      super + "<span> #{I18n.t('simple_form.or')} </span>".html_safe + 
          template.text_field_tag(attribute_name, nil, :placeholder => placeholder, :class => "span2")
    else
      super
    end
  end
end
