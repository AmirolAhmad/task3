class ListItemsController < ApplicationController
  before_action :set_list, only:[:index, :new, :create, :edit, :update, :destroy, :show]
  before_action :set_list_item, only: [:show, :edit, :update, :destroy]

  # GET /list_items
  # GET /list_items.json
  def index
    @list_items = @list.list_items
  end

  # GET /list_items/1
  # GET /list_items/1.json
  def show
  end

  # GET /list_items/new
  def new
    @list_item = ListItem.new
    render
  end

  # GET /list_items/1/edit
  def edit
    @tags = Tag.all
  end

  # POST /list_items
  # POST /list_items.json
  def create
    @tags = Tag.all
    @list_item = @list.list_items.new(list_item_params)

    respond_to do |format|
      if @list_item.save
        format.html { redirect_to list_path(@list), notice: 'List item was successfully created.' }
        format.json { render :show, status: :created, location: @list_item }
      else
        format.html { render :new }
        format.json { render json: @list_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /list_items/1
  # PATCH/PUT /list_items/1.json
  def update
    respond_to do |format|
      if @list_item.update(list_item_params)
        format.html { redirect_to list_path(@list), notice: 'List item was successfully updated.' }
        format.json { render :show, status: :ok, location: @list_item }
      else
        format.html { render :edit }
        format.json { render json: @list_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /list_items/1
  # DELETE /list_items/1.json
  def destroy
    @list_item.destroy
    respond_to do |format|
      format.html { redirect_to list_path(@list), notice: 'List item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_list
      @list = List.find params[:list_id]
      rescue ActiveRecord::RecordNotFound
        redirect_to(root_url, :notice => 'Record not found')
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_list_item
      @list_item = @list.list_items.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        redirect_to(root_url, :notice => 'Record not found')
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def list_item_params
      params.require(:list_item).permit(:list_id, :name, :deleted_at, :deleted, :tag_id)
    end
end
