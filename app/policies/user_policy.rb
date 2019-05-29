class UserPolicy < ApplicationPolicy

  # do we need the Scope class at all since there is no user index view?
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  # you can only view your own profile dashboard
  def show?
    user_is_owner?
  end

  def update?
    user_is_owner?
  end

  def destroy?
    user_is_owner?
  end

  private

  def user_is_owner?
    user == record
  end
end
