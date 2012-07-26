module PostsHelper
  def post_stat(name, number)
    "<a class=\"#{name}\">#{'(' + number.to_s + ')' if number > 0}</a>".html_safe
  end
  
  def word_count(count = 140)
    content_tag :div, :class => "word-count" do 
      "<em><span class=\"count\">0</span>/<span class=\"max-count\">#{count}</span></em>".html_safe
    end
  end
end
