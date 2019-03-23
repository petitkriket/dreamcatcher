class ClassfieldImagesController < ApplicationController
  before_action :set_classfield_image, only: [:show, :edit, :update, :destroy]

  # GET /classfield_images
  # GET /classfield_images.json
  def index
    @classfield_images = ClassfieldImage.all
  end

  # GET /classfield_images/1
  # GET /classfield_images/1.json
  def show
  end

  # GET /classfield_images/new
  def new
    @classfield_image = ClassfieldImage.new
  end

  # GET /classfield_images/1/edit
  def edit
  end

  # POST /classfield_images
  # POST /classfield_images.json
  def create
    @classfield_image = ClassfieldImage.new(classfield_image_params)

    respond_to do |format|
      if @classfield_image.save
        format.html { redirect_to @classfield_image, notice: 'Classfield image was successfully created.' }
        format.json { render :show, status: :created, location: @classfield_image }
      else
        format.html { render :new }
        format.json { render json: @classfield_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /classfield_images/1
  # PATCH/PUT /classfield_images/1.json
  def update
    respond_to do |format|
      if @classfield_image.update(classfield_image_params)
        format.html { redirect_to @classfield_image, notice: 'Classfield image was successfully updated.' }
        format.json { render :show, status: :ok, location: @classfield_image }
      else
        format.html { render :edit }
        format.json { render json: @classfield_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /classfield_images/1
  # DELETE /classfield_images/1.json
  def destroy
    @classfield_image.destroy
    respond_to do |format|
      format.html { redirect_to classfield_images_url, notice: 'Classfield image was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_classfield_image
      @classfield_image = ClassfieldImage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def classfield_image_params
      params.require(:classfield_image).permit(:classfield, :url)
    end
end
