class BaseMenusController < ApplicationController
  before_action :get_owner
  before_action :set_base_menu, only: %i[ show edit update destroy ]

  # GET /base_menus or /base_menus.json
  def index
    # Using to return base menus with particular owner instances
    @base_menus = @owner.base_menus
  end

  # GET /base_menus/1 or /base_menus/1.json
  def show
  end

  # GET /base_menus/new
  def new
    @base_menu = @owner.base_menus.build
  end

  # GET /base_menus/1/edit
  def edit
  end

  # POST /base_menus or /base_menus.json
  def create
    @base_menu = @owner.base_menus.build(base_menu_params)

    respond_to do |format|
      if @base_menu.save
        format.html { redirect_to owner_base_menus_path(@owner), notice: "Base menu was successfully created." }
        format.json { render :show, status: :created, location: @base_menu }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @base_menu.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /base_menus/1 or /base_menus/1.json
  def update
    respond_to do |format|
      if @base_menu.update(base_menu_params)
        format.html { redirect_to owner_base_menu_path(@owner), notice: "Base menu was successfully updated." }
        format.json { render :show, status: :ok, location: @base_menu }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @base_menu.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /base_menus/1 or /base_menus/1.json
  def destroy
    @base_menu.destroy!

    respond_to do |format|
      format.html { redirect_to owner_base_menus_path(@owner), status: :see_other, notice: "Base menu was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Added this line to allow relate menus to a specific owner
    def get_owner
      @owner = Owner.find(params[:owner_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_base_menu
      @base_menu = @owner.base_menus.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def base_menu_params
      params.require(:base_menu).permit(:title, :description, :owner_id)
    end
end
