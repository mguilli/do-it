class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @list = List.find(params[:list_id])
    @items = Item.all
  end

  def show
  end

  def new
    @list = List.find(params[:list_id])
    @item = Item.new
  end

  def edit
    @list = List.find(params[:list_id])
    @item = Item.find(params[:id])
  end

  def create
    @list = List.find(params[:list_id])
    @item = @list.items.build(item_params)

    if @item.save
      redirect_to @list, notice: 'Item was successfully created.'       
    else
      redirect_to :back
    end
  end

  def update
    @list = List.find(params[:list_id])

    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @list, notice: 'Item was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  def destroy
    @list = List.find(params[:list_id])

    if @item.destroy
      redirect_to @list, notice: 'Item was successfully completed.'
    else
      redirect_to :back
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:name)
    end
end
