class PrototypesController < ApplicationController
before_action :authenticate_user!, only: [:destroy, :new, :edit]

  def index
    @prototype = Prototype.all
  end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to root_path(@prototype)
    else
      render :new
    end
  end

  def show
    @prototype = Prototype.find(params[:id])
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
  end

  def edit
    @prototype = Prototype.find(params[:id])
    unless user_signed_in? && current_user.id == @prototype.user_id
      redirect_to action: :index
    end
  end

  def update
    prototype = Prototype.find(params[:id])
    if prototype.update(prototype_params)
      redirect_to prototype_path(prototype)
    else
      render :edit
    end
  end

  def destroy
    prototype = Prototype.find(params[:id])
    if user_signed_in? && current_user.id == prototype.user_id
    prototype.destroy
    redirect_to root_path
    else
      redirect_to action: :index
    end
  end

  private

  def prototype_params
  params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end

end
