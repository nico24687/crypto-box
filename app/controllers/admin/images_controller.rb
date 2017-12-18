class Admin::ImagesController < Admin::BaseController

  def index
    @images = Image.all
  end 

  def new 
    @image = Image.new
  end

  def create
    @image = Image.create(image_params)
    if @image.save 
      flash[:success] = "Successfully created your image"
      redirect_to admin_images_path
    else
      render :new
    end 
  end 
  
  private 
  def image_params
    params.require(:image).permit(:url)
  end
end