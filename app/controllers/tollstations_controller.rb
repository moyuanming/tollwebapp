class TollstationsController < ApplicationController
  before_action :set_tollstation, only: [:show, :edit, :update, :destroy]

  # GET /tollstations
  # GET /tollstations.json
  def index
    @tollstations = Tollstation.all
  end

  # GET /tollstations/1
  # GET /tollstations/1.json
  def show
  end

  # GET /tollstations/new
  def new
    @tollstation = Tollstation.new
    @glj = Gljdaima.all
    @pianqu = Pianqudaima.all
  end

  # GET /tollstations/1/edit
  def edit
  end

  # POST /tollstations
  # POST /tollstations.json
  def create
    @tollstation = Tollstation.new(tollstation_params)

    respond_to do |format|
      if @tollstation.save
        format.html { redirect_to @tollstation, notice: 'Tollstation was successfully created.' }
        format.json { render :show, status: :created, location: @tollstation }
      else
        format.html { render :new }
        format.json { render json: @tollstation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tollstations/1
  # PATCH/PUT /tollstations/1.json
  def update
    respond_to do |format|
      if @tollstation.update(tollstation_params)
        format.html { redirect_to @tollstation, notice: 'Tollstation was successfully updated.' }
        format.json { render :show, status: :ok, location: @tollstation }
      else
        format.html { render :edit }
        format.json { render json: @tollstation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tollstations/1
  # DELETE /tollstations/1.json
  def destroy
    @tollstation.destroy
    respond_to do |format|
      format.html { redirect_to tollstations_url, notice: 'Tollstation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tollstation
      @tollstation = Tollstation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tollstation_params
      params.require(:tollstation).permit(:name, :oldnetwork, :oldplaza, :oldip, :newnetwork, :newplaza, :newip, :pianqudaima_id, :gljdaima_id)
    end
end
