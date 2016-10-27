class FlashcardsController < ApplicationController

  def show
    @flashcard = Flashcard.find(params[:id])
  end

  def new
    @flashcard = Flashcard.new
  end

  def create
    flashcard = Flashcard.new(flashcard_params)
    if flashcard.save
      redirect_to(flashcard_path(flashcard))
    else
      render :new
    end
  end

  def edit
    @flashcard = Flashcard.find(params[:id])
  end

  def update
    flashcard = Flashcard.find(params[:id])
    if flashcard.update(flashcard_params)
      redirect_to(flashcard_path(flashcard))
    else
      render :edit
    end
  end

  def destroy
  flashcard = Flashcard.find(params[:id])
    if flashcard.destroy
      redirect_to('/')
    else
      redirect_to edit_flashcard_path(flashcard)
    end
  end

  private

  def flashcard_params
    params.require(:flashcard).permit(:question, :answer)
  end
end
