class PasController < ApplicationController
  before_action :set_pa, only: %i[ show edit update destroy ]

  # GET /pas or /pas.json
  def index
    @pas = Pa.all
  end

  # GET /pas/1 or /pas/1.json
  def show
  end

  # GET /pas/new
  def new
    @pa = Pa.new
  end

  # GET /pas/1/edit
  def edit
  end

  # POST /pas or /pas.json
  def create
    @pa = Pa.new(pa_params)

    respond_to do |format|
      if @pa.save
        flash.now[:notice] = "Pa was successfully created."
        format.turbo_stream
        format.html { redirect_to pa_url(@pa) }
        format.json { render :show, status: :created, location: @pa }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @pa.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pas/1 or /pas/1.json
  def update
    respond_to do |format|
      if @pa.update(pa_params)
        flash.now[:notice] = "Pa was successfully updated."
        format.html { redirect_to pa_url(@pa) }
        format.json { render :show, status: :ok, location: @pa }
        format.turbo_stream
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @pa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pas/1 or /pas/1.json
  def destroy
    @pa.destroy!

    respond_to do |format|
      flash.now[:notice] = "Pa was successfully destroyed."
      format.html { redirect_to pas_url }
      format.json { head :no_content }
      format.turbo_stream
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pa
      @pa = Pa.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pa_params
      params.require(:pa).permit(:code, :description, :objective, :start_date, :end_date, :uo_id, :horizon)
    end
end
