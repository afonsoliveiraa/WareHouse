class UosController < ApplicationController
  before_action :set_uo, only: %i[ show edit update destroy ]

  # GET /uos or /uos.json
  def index
    @uos = Uo.all
  end

  # GET /uos/1 or /uos/1.json
  def show
  end

  # GET /uos/new
  def new
    @uo = Uo.new
  end

  # GET /uos/1/edit
  def edit
  end

  # POST /uos or /uos.json
  def create
    @uo = Uo.new(uo_params)

    respond_to do |format|
      if @uo.save
        flash.now[:notice] = "Uo was successfully created."
        format.turbo_stream
        format.html { redirect_to uo_url(@uo) }
        format.json { render :show, status: :created, location: @uo }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @uo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /uos/1 or /uos/1.json
  def update
    respond_to do |format|
      if @uo.update(uo_params)
        flash.now[:notice] = "Uo was successfully updated."
        format.html { redirect_to uo_url(@uo) }
        format.json { render :show, status: :ok, location: @uo }
        format.turbo_stream
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @uo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /uos/1 or /uos/1.json
  def destroy
    @uo.destroy!

    respond_to do |format|
      flash.now[:notice] = "Uo was successfully destroyed."
      format.html { redirect_to uos_url }
      format.json { head :no_content }
      format.turbo_stream
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_uo
      @uo = Uo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def uo_params
      params.require(:uo).permit(:description, :start_date, :end_date, :kind, :abbreviation)
    end
end
