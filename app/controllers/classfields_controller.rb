class ClassfieldsController < ApplicationController
  before_action :set_classfield, only: [:show]
  before_action :redirect_user, only: [ :new, :edit, :destroy]

  # GET /classfields
  # GET /classfields.json
  def index
    @classfields = Classfield.all.order('created_at DESC')
  end

  # GET /classfields/1
  # GET /classfields/1.json
  def show
  end

  # GET /classfields/new
  def new
    @classfield = Classfield.new
  end

  # GET /classfields/1/edit
  def edit
  end

  # POST /classfields
  # POST /classfields.json
  def create
    @classfield = Classfield.new(classfield_params)

    respond_to do |format|
      if @classfield.save
        format.html { redirect_to @classfield, notice: 'Classfield was successfully created.' }
        format.json { render :show, status: :created, location: @classfield }
      else
        format.html { render :new }
        format.json { render json: @classfield.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /classfields/1
  # PATCH/PUT /classfields/1.json
  def update
    respond_to do |format|
      if @classfield.update(classfield_params)
        format.html { redirect_to @classfield, notice: 'Classfield was successfully updated.' }
        format.json { render :show, status: :ok, location: @classfield }
      else
        format.html { render :edit }
        format.json { render json: @classfield.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /classfields/1
  # DELETE /classfields/1.json
  def destroy
    @classfield.destroy
    respond_to do |format|
      format.html { redirect_to classfields_url, notice: 'Classfield was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

def redirect_user
  redirect_to classfields_path
end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_classfield
      @classfield = Classfield.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def classfield_params
      params.require(:classfield).permit(:offer_id, :url, :price, :size, :rooms_count, :bedrooms, :offer_type, :district_area, :full_description, :energy_ratio, :construction_date, :offer_view_count, :agency, :origin)
    end
end
