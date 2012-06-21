module RedCloth::Formatters::HTML
  include RedCloth::Formatters::Base
  def after_transform(text)
    text.chomp!
    clean_html(text, ALLOWED_TAGS)
  end
  ALLOWED_TAGS = {
      'a' => ['href', 'title'],
      'br' => [],
      'i' => nil,
      'u' => nil,
      'b' => nil,
      'code' => ['lang'],
      'strong' => nil,
      'em' => nil,
      'table' => nil,
      'tr' => nil,
      'td' => ['colspan', 'rowspan'],
      'th' => nil,
      'ol' => ['start'],
      'ul' => nil,
      'li' => nil,
      'p' => nil,
      'h4' => nil,
      'h5' => nil,
      'h6' => nil,
    }
end