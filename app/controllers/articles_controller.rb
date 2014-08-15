class ArticlesController < ApplicationController
  def list
    @articles = Article.where(published: true).order('id desc')
  end

  def item
  end
end
