class ClassifiedsController < ApplicationController
  before_action :set_classified, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  autocomplete :classified, :full => true
  
  PAGE_SIZE = 10
  # GET /items
  # GET /items.json
  def index
    @classifieds = Classified.all
    @categories = Category.all

    @page = (params[:page] || 0).to_i
    if params[:search].present?
      @keywords = params[:search]
      classified_search_term = ClassifiedSearchTerm.new(@keywords)
      @classifieds = Classified.where(
        classified_search_term.where_clause,
        classified_search_term.where_args).
        order(classified_search_term.order).
        offset(PAGE_SIZE * @page).limit(PAGE_SIZE)
    else

    end

  end

  # GET /items/1
  # GET /items/1.json
  def show
    @classified = Classified.find(params[:id])
    rescue ActiveRecord::RecordNotFound => e
  end

  # GET /items/new
  def new
    @classified = Classified.new
  end

  # GET /items/1/edit
  def edit
  end

  def search

  end

private
def force_json
  request.format = :json
end
  # POST /items
  # POST /items.json
  def create
    @classified = Classified.new(classified_params)
    @classified.user_id = current_user.id
    respond_to do |format|
      if @classified.save
        format.html { redirect_to @classified, notice: 'Classified was successfully created.' }
        format.json { render :show, status: :created, location: @classified }
      else
        format.html { render :new }
        format.json { render json: @classified.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @classified.update(classified_params)
        format.html { redirect_to @classified, notice: 'Classified was successfully updated.' }
        format.json { render :show, status: :ok, location: @classified }
      else
        format.html { render :edit }
        format.json { render json: @classified.errors, status: :unprocessable_entity }
      end
    end
  end

  def search
    @classifieds = Classified.ransack(title_cont: params[:q]).result(distinct: true).limit(5)
    @categories = Category.ransack(name_cont: params[:q]).result(distinct: true).limit(5)
    respond_to do |format|
      format.html {}
      format.json {
        @classifieds = @classifieds.limit(5)
        @categories = @categories.limit(5)
      }
    end
end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @classified.destroy
    respond_to do |format|
      format.html { redirect_to classifieds_url, notice: 'Classified was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_classified
      @classified = Classified.find(params[:id])
    end

    def show_category
      @category = Category.find(params.fetch[:id])
      logger.debug "New post: #{@category.attributes.inspect}"
      logger.debug "Post should be valid: #{@category.valid?}"
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def classified_params
      params.require(:classified).permit(:title, :price, :location, :description, :email, :category_id)
      end
end
