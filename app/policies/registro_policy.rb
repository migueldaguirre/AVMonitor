class RegistroPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end


  def show?
    record.user == user
  end


  def create?
    true
    # Anyone can access a "Registo" form
  end

  def update?
    # It just can be modified by its owner
    record.user == user

  end


end
