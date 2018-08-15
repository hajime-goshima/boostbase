class PublicController < ApplicationController
  def index
  end

  def article
    @article = Article.where('slug = ? OR id = ?', params[:id], params[:id]).first
    raise Exception.new('404 Article Not found.') if @article.nil?
  end

  def tag
    @tag = Tag.where('slug = ? OR id = ?', params[:id], params[:id]).first
    raise Exception.new('404 Tag Not found.') if @tag.nil?
  end

  def category
    @category = Category.where('slug = ? OR id = ?', params[:id], params[:id]).first
    raise Exception.new('404 Category Not found.') if @category.nil?
  end
end
