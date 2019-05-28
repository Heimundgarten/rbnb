class ReviewPolicy < ApplicationPolicy

  # do we need the Scope class at all since there is no user index view?
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show? # can be deleted since there is no show method in review controller?
    true
  end

  def create?
    true
  end

  def update? # can be deleted since there is no show method in review controller?
    user_is_owner?
  end

  def destroy?
    user_is_owner?
  end

  private

  def user_is_owner?
    user == record.user
  end
end
