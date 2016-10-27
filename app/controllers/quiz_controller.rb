class QuizController < ApplicationController

  def index
    if params[:id]
      @flashcard = Flashcard.find(params[:id]).next

    else
      @flashcard = Flashcard.first
    end

    @flashcard.attempts = 3
  end

  def check_answer
    answer = params[:answer]

    @flashcard = Flashcard.find(params[:id])

    if @flashcard.answer == answer
      flash[:notice] = "Correct Answer"

      redirect_to :action => "index", :id => params[:id] and return
    else
      if params[:attempts].to_i != 0
        @flashcard.attempts = params[:attempts].to_i - 1
      else
        @flashcard.attempts = 0
        flash[:notice] = "No More Attempts, Please go to the next question"
      end
    end

    render 'index'
  end

  def next
   redirect_to :action => "index", :id => params[:id]
  end
end
