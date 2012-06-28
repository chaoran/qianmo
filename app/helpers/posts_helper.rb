module PostsHelper
  def post_stat(name, number)
    "<a class=\"#{name}\">#{'(' + number.to_s + ')' if number > 0}</a>".html_safe
  end
end
