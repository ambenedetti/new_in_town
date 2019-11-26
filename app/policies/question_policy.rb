class QuestionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      user.questions
    end
  end

  def create?
    true
  end

  def ignore?
    true
  end

  def show?
    true
  end

  def edit?
    record.user == user
  end

  def update?
    record.user == user
  end
end
