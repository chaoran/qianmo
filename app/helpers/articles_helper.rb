module ArticlesHelper
  def article_path(article)
    if controller_name == "pages"
      page_article_path(article)
    else
      user_article_path(article)
    end
  end
end