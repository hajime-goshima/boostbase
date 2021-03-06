class Admin::ArticlesController < AdminController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.all
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(article_params)
    respond_to do |format|
      if @article.save

        # set tags to article

        if params.key?(:tags) && params[:tags].present?
          params[:tags].each do |tag_id|
            begin
              @article.tags << Tag.find(tag_id)
            rescue ActiveRecord::RecordNotFound => e
              Rails.logger.error(e)
              Rails.logger.error("Tag#id=#{tag_id}")
            end
          end
        end

        format.html { redirect_to admin_article_path(@article), notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    respond_to do |format|
      @article.tags.delete_all
      if @article.update(article_params)

        # set tags to article

        if params.key?(:tags) && params[:tags].present?
          params[:tags].each do |tag_id|
            begin
              @article.tags << Tag.find(tag_id)
            rescue ActiveRecord::RecordNotFound => e
              Rails.logger.error(e)
              Rails.logger.error("Tag#id=#{tag_id}")
            end
          end
        end

        format.html { redirect_to admin_article_path(@article), notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to admin_articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_article
    @article = Article.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def article_params
    params.require(:article).permit(:title, :content, :description, :slug, :stylesheet_code, :javascript_code, :category_id)
  end
end
