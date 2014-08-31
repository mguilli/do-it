class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy]

  def index
    @lists = policy_scope(List)
  end

  def show
    @items = @list.items
    @item = Item.new
    authorize @list
  end

  def new
    @list = List.new
    authorize @list
  end

  def edit
    authorize @list
  end

  def create
    @list = current_user.lists.build(list_params)
    authorize @list

    respond_to do |format|
      if @list.save
        format.html { redirect_to @list, notice: 'List was successfully created.' }
        format.json { render action: 'show', status: :created, location: @list }
      else
        format.html { render action: 'new' }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    authorize @list
    respond_to do |format|
      if @list.update(list_params)
        format.html { redirect_to @list, notice: 'List was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    authorize @list
    @list.destroy
    respond_to do |format|
      format.html { redirect_to lists_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list
      @list = List.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def list_params
      params.require(:list).permit(:label)
    end
end
