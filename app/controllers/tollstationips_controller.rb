class TollstationipsController < ApplicationController
  before_action :set_tollstationip, only: [:show, :edit, :update, :destroy]

  # GET /tollstationips
  # GET /tollstationips.json
  def index
    @tollstationips = Tollstationip.all
  end

  # GET /tollstationips/1
  # GET /tollstationips/1.json
  def show
  end

  # GET /tollstationips/new
  def new
    @tollstationip = Tollstationip.new
    @tollstationip.tollstation_id =params[:format]
  end


  # GET /tollstationips/1/edit
  def edit
  end

  # POST /tollstationips
  # POST /tollstationips.json
  def create
    @tollstationip = Tollstationip.new(tollstationip_params)

    respond_to do |format|
      if @tollstationip.save
        format.html { redirect_to @tollstationip, notice: 'Tollstationip was successfully created.' }
        format.json { render :show, status: :created, location: @tollstationip }
      else
        format.html { render :new }
        format.json { render json: @tollstationip.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tollstationips/1
  # PATCH/PUT /tollstationips/1.json
  def update
    respond_to do |format|
      if @tollstationip.update(tollstationip_params)
        format.html { redirect_to @tollstationip, notice: 'Tollstationip was successfully updated.' }
        format.json { render :show, status: :ok, location: @tollstationip }
      else
        format.html { render :edit }
        format.json { render json: @tollstationip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tollstationips/1
  # DELETE /tollstationips/1.json
  def destroy
    @tollstationip.destroy
    respond_to do |format|
      format.html { redirect_to tollstationips_url, notice: 'Tollstationip was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tollstationip
      @tollstationip = Tollstationip.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tollstationip_params
      params.require(:tollstationip).permit(:oldnetwork, :oldplaza, :oldip, :newnetwork, :newplaza, :newip, :tollstation_id)
    end
end
