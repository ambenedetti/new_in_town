class QuestionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    current_user.update(unread_questions: 0)
    @user_questions = policy_scope(Question).includes(:user)
    @answer_questions = current_user.questions_to_answer.where(status: 'open')
    @answer_questions = @answer_questions.order(created_at: :desc)
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
    user_ids = UserCity.where(name: params[:city]).pluck(&:user_id)
    User.increment_counter(:unread_count, user_ids)
    if @question.save
      redirect_to questions_path
    else
      render :new
    end
  end

  def show
    set_question
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
    redirect_to questions_path
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
