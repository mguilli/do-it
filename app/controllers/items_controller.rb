class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy] #do
  before_action :set_list
    # :set_item, only: [:show, :edit, :update, :destroy]
  # end

  def index
    authorize @list #Checks policy for authorization of parent List ownership
    @items = @list.items.all
    # authorize @items
  end

  def show
    authorize @item
  end

  def new
   @item = Item.new
   authorize @item
  end

  def edit
    authorize @item
  end

  def create
   @item = @list.items.build(item_params)
   authorize @item

    if @item.save
      redirect_to @list, notice: 'Item was successfully created.'       
    else
      redirect_to :back
    end
  end

  def update
    authorize @item

    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @list, notice: 'Item was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  def destroy
    authorize @item

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

    def set_list
      @list = List.find(params[:list_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:name)
    end
end
