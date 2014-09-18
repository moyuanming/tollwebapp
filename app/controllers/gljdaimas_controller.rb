class GljdaimasController < ApplicationController
  before_action :set_gljdaima, only: [:show, :edit, :update, :destroy]

  # GET /gljdaimas
  # GET /gljdaimas.json
  def index
    @gljdaimas = Gljdaima.all
  end

  # GET /gljdaimas/1
  # GET /gljdaimas/1.json
  def show
  end

  # GET /gljdaimas/new
  def new
    @gljdaima = Gljdaima.new
  end

  # GET /gljdaimas/1/edit
  def edit
  end

  # POST /gljdaimas
  # POST /gljdaimas.json
  def create
    @gljdaima = Gljdaima.new(gljdaima_params)

    respond_to do |format|
      if @gljdaima.save
        format.html { redirect_to @gljdaima, notice: 'Gljdaima was successfully created.' }
        format.json { render :show, status: :created, location: @gljdaima }
      else
        format.html { render :new }
        format.json { render json: @gljdaima.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gljdaimas/1
  # PATCH/PUT /gljdaimas/1.json
  def update
    respond_to do |format|
      if @gljdaima.update(gljdaima_params)
        format.html { redirect_to @gljdaima, notice: 'Gljdaima was successfully updated.' }
        format.json { render :show, status: :ok, location: @gljdaima }
      else
        format.html { render :edit }
        format.json { render json: @gljdaima.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gljdaimas/1
  # DELETE /gljdaimas/1.json
  def destroy
    

    @gljdaima.destroy
    respond_to do |format|
      format.html { redirect_to gljdaimas_url, notice: 'Gljdaima was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  def showtollstations
    @title = "Following"
    @gljdaima = Gljdaima.find(params[:id])
    @title =@gljdaima.name +  "管辖收费站信息"
    @tollstations = Tollstation.where(gljdaima_id:@gljdaima.id)
    render 'show_tollstation'
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gljdaima
      @gljdaima = Gljdaima.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gljdaima_params
      params.require(:gljdaima).permit(:name, :no, :desc)
    end
end
