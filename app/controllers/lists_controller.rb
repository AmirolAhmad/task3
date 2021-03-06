class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy, :delete, :restore]

  # GET /lists
  # GET /lists.json
  def index
    @lists = List.all
  end

  # GET /lists/1
  # GET /lists/1.json
  def show
    @list_items = @list.list_items
  end

  # GET /lists/new
  def new
    @list = List.new
  end

  # GET /lists/1/edit
  def edit
  end

  # POST /lists
  # POST /lists.json
  def create
    @list = List.new(list_params)

    respond_to do |format|
      if @list.save
        format.html { redirect_to @list, notice: 'List was successfully created.' }
        format.json { render :show, status: :created, location: @list }
      else
        format.html { render :new }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lists/1
  # PATCH/PUT /lists/1.json
  def update
    respond_to do |format|
      if @list.update(list_params)
        format.html { redirect_to @list, notice: 'List was successfully updated.' }
        format.json { render :show, status: :ok, location: @list }
      else
        format.html { render :edit }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lists/1
  # DELETE /lists/1.json
  def destroy
    @list.destroy(:soft)
    respond_to do |format|
      format.html { redirect_to lists_url, notice: 'List was successfully destroy.' }
      format.json { head :no_content }
    end
  end

  def delete
    @list.destroy(:hard)
    respond_to do |format|
      format.html { redirect_to lists_url, notice: 'List was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  def restore
    @list.update(deleted_at: nil)
    respond_to do |format|
      format.html { redirect_to lists_url, notice: 'List was successfully restored.' }
      format.json { head :no_content }
    end
  end

  def trash
    @soft_delete_lists = List.unscope(:where).where("deleted_at IS NOT NULL")
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list
      @list = List.unscope(:where).find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def list_params
      params.require(:list).permit(:name, :deleted_at, :deleted)
    end
end
