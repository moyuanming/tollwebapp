class PianqudaimasController < ApplicationController
  before_action :set_pianqudaima, only: [:show, :edit, :update, :destroy]

  # GET /pianqudaimas
  # GET /pianqudaimas.json
  def index
    @pianqudaimas = Pianqudaima.all
  end

  # GET /pianqudaimas/1
  # GET /pianqudaimas/1.json
  def show
  end

  # GET /pianqudaimas/new
  def new
    @pianqudaima = Pianqudaima.new
  end

  # GET /pianqudaimas/1/edit
  def edit
  end

  # POST /pianqudaimas
  # POST /pianqudaimas.json
  def create
    @pianqudaima = Pianqudaima.new(pianqudaima_params)

    respond_to do |format|
      if @pianqudaima.save
        
        format.html { redirect_to @pianqudaima, notice: 'Pianqudaima was successfully created.' }
        format.json { render :show, status: :created, location: @pianqudaima }
      else
        format.html { render :new }
        format.json { render json: @pianqudaima.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pianqudaimas/1
  # PATCH/PUT /pianqudaimas/1.json
  def update
    respond_to do |format|
      if @pianqudaima.update(pianqudaima_params)
        format.html { redirect_to @pianqudaima, notice: 'Pianqudaima was successfully updated.' }
        format.json { render :show, status: :ok, location: @pianqudaima }
      else
        format.html { render :edit }
        format.json { render json: @pianqudaima.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pianqudaimas/1
  # DELETE /pianqudaimas/1.json
  def destroy
    @pianqudaima.destroy
    respond_to do |format|
      format.html { redirect_to pianqudaimas_url, notice: 'Pianqudaima was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def showgljinfo
      @title = "show Glj Info"
    @pianqudaima = Pianqudaima.find(params[:id])
    @showgljs = Gljdaima.where(pianqudaima_id:@pianqudaima.id)
    render 'show_gljinfo'
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pianqudaima
      @pianqudaima = Pianqudaima.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pianqudaima_params
      params.require(:pianqudaima).permit(:name, :no, :desc)
    end
end
