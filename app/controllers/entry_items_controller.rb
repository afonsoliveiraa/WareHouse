class EntryItemsController < ApplicationController
  before_action :set_entry
  before_action :set_entry_item, only: %i[ show edit update destroy ]

  # GET /entry_items or /entry_items.json
  def index
    @entry_items = EntryItem.all
  end

  # GET /entry_items/1 or /entry_items/1.json
  def show
  end

  # GET /entry_items/new
  def new
    @entry_item = EntryItem.new
  end

  # GET /entry_items/1/edit
  def edit
  end

  def total_entry(id)
    entry =  Entry.find_by(id: id)

    total_entry = entry.entry_items.sum('quantity * unit_price')
    total_entry
  end

  # POST /entry_items or /entry_items.json
  def create
    @entry_item = EntryItem.new(entry_item_params)
    valor_item = entry_item_params[:quantity].to_f * entry_item_params[:unit_price].to_f

    if valor_item + total_entry(@entry_item.entry.id) <= @entry.total
      respond_to do |format|
        if @entry_item.save
          flash.now[:notice] = "Entry item was successfully created."
          format.turbo_stream
          format.html { redirect_to entry_url(params[:entry_id]) }
          format.json { render :show, status: :created, location: @entry_item }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @entry_item.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        flash.now[:notice] = "Valor do item superior ao total da nota"
        format.html { redirect_to entry_path(entry_item_params[:entry_id]) }
        format.turbo_stream { render turbo_stream: turbo_stream.replace("notice", partial: "layouts/flash") }
      end
    end
  end

  # PATCH/PUT /entry_items/1 or /entry_items/1.json
  def update
    @entry_item = EntryItem.find(params[:id])
    valor_item = entry_item_params[:quantity].to_f * entry_item_params[:unit_price].to_f
  

    if total_entry(@entry_item.entry.id) == @entry.total
      respond_to do |format|
        flash.now[:notice] = "A nota precisa estar pendente"
        format.html { redirect_to entry_path(entry_item_params[:entry_id]) }
        format.turbo_stream { render turbo_stream: turbo_stream.replace("notice", partial: "layouts/flash") }
      end
    elsif valor_item + (total_entry(@entry_item.entry.id) - (@entry_item.quantity * @entry_item.unit_price)) > @entry.total
      respond_to do |format|
        flash.now[:notice] = "Valor do item superior ao total da nota"
        format.html { redirect_to entry_path(entry_item_params[:entry_id]) }
        format.turbo_stream { render turbo_stream: turbo_stream.replace("notice", partial: "layouts/flash") }
      end
    else
      respond_to do |format|
        if @entry_item.update(entry_item_params)
          flash.now[:notice] = "Entry item was successfully updated."
          format.html { redirect_to entry_url(params[:entry_id]) }
          format.json { render :show, status: :ok, location: @entry_item }
          format.turbo_stream
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @entry_item.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /entry_items/1 or /entry_items/1.json
  def destroy
    @entry_item.destroy!

    respond_to do |format|
      flash.now[:notice] = "Entry item was successfully destroyed."
      format.html { redirect_to entry_url(params[:entry_id]) }
      format.json { head :no_content }
      format.turbo_stream
    end
  end

  private
    def set_entry
      @entry = Entry.find(params[:entry_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_entry_item
      @entry_item = EntryItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def entry_item_params
      params.require(:entry_item).permit(:entry_id, :item_id, :quantity, :unit_price)
    end
end
