class RegistroPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
        else
        scope.where(user: user)
      end
    end
  end

  def index?
    true
  end

  def show?
    record.user == user
    user_is_owner_or_admin?
  end


  def create?
    true
    # Anyone can access a "Registo" form
  end

  def update?
    # It just can be modified by its owner
    user_is_owner_or_admin?
  end

  def destroy?
    user_is_owner_or_admin?
  end

private

  def user_is_owner_or_admin?
    user.admin || record.user == user
  end


end
