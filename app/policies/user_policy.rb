class UserPolicy < ApplicationPolicy

  # do we need the Scope class at all since there is no user index view?
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def create? # can be deleted because no new and create methods in controller?
    true
  end

  def update?
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
