class BaseMenusController < ApplicationController
  before_action :authenticate_owner!
  before_action :set_base_menu, only: %i[ show edit update destroy ]

  # GET /base_menus or /base_menus.json
  def index
    @base_menus = current_owner.base_menus #helper for a current signed in user = owner
  end

  # GET /base_menus/1 or /base_menus/1.json
  def show
    @menu_items = @base_menu.menu_items
  end

  # GET /base_menus/new
  def new
    @base_menu = current_owner.base_menus.build
  end

  # GET /base_menus/1/edit
  def edit
  end

  # POST /base_menus or /base_menus.json
  def create
    @base_menu = current_owner.base_menus.build(base_menu_params)

    respond_to do |format|
      if @base_menu.save
        format.html { redirect_to @base_menu, notice: "Base menu was successfully created." }
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
        format.html { redirect_to @base_menu, notice: "Base menu was successfully updated." }
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
      format.html { redirect_to base_menus_path, status: :see_other, notice: "Base menu was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_base_menu
      @base_menu = current_owner.base_menus.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def base_menu_params
      params.require(:base_menu).permit(:title, :description, :owner_id)
    end
end
