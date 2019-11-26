class QuestionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @user_questions = policy_scope(Question).includes(:user)
    @answer_questions = current_user.questions_to_answer
    @answer_questions = @answer_questions.order(status: :asc).order(created_at: :desc)
  end

  def new
    @question = Question.new
    authorize @question
  end

  def create
    @question = Question.new(question_params)
    authorize @question
    @question.user = current_user
    @question.status = 0
    if @question.save
      redirect_to questions_path
    else
      render :new
    end
  end

  def edit
    set_question
  end

  def update
    set_question
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to questions_path, notice: "#{@question.title} was successfully updated." }
        format.json { render :index, status: :ok, location: questions_path }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  def ignore
    set_question
    @question.ignored!
    save @question
  end

private

  def question_params
    params.require(:question).permit(:city, :title, :status, :category_id)
  end

  def set_question
    @question = Question.find(params[:id])
    authorize @question
  end
end
