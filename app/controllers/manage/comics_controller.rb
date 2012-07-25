class Manage::ComicsController < Manage::BaseController


  # GET /comics
  # GET /comics.json
  def index
    @comics = Comic.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @comics }
    end
  end

  # GET /comics/1
  # GET /comics/1.json
  def show
    @comic = Comic.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @comic }
    end
  end

  # GET /comics/new
  # GET /comics/new.json
  def new
    @comic = Comic.new
    @series = Serie.available

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @comic }
    end
  end

  # GET /comics/1/edit
  def edit
    @comic = Comic.find(params[:id])
    @series = Serie.available
  end

  # POST /comics
  # POST /comics.json
  def create
    @comic = Comic.new(params[:comic])

    respond_to do |format|
      if @comic.save
        format.html { redirect_to [:manage, @comic], notice: 'Comic was successfully created.' }
        format.json { render json: @comic, status: :created, location: @comic }
      else
        @series = Serie.available
        format.html { render action: "new" }
        format.json { render json: @comic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /comics/1
  # PUT /comics/1.json
  def update
    @comic = Comic.find(params[:id])

    respond_to do |format|
      if @comic.update_attributes(params[:comic])
        format.html { redirect_to [:manage, @comic], notice: 'Comic was successfully updated.' }
        format.json { head :no_content }
      else
        @series = Serie.available
        format.html { render action: "edit" }
        format.json { render json: @comic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comics/1
  # DELETE /comics/1.json
  def destroy
    @comic = Comic.find(params[:id])
    @comic.destroy

    respond_to do |format|
      format.html { redirect_to manage_comics_url }
      format.json { head :no_content }
    end
  end
end
