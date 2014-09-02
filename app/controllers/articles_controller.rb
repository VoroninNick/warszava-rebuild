class ArticlesController < ApplicationController
  def list
    @articles = Article.where(published: true).order('id desc')
  end

  def item
    #page_id = @article = Page.translation_class.where(path: params['path']).first.vs_page_id
    #page = Page.where(id: page)
    page = Page.where(id: params[:page_id]).first
    @article = page.custom_page

    @articles = Article.where(published: true).order('id desc').limit(4)
    #.custom_page
  end
end
