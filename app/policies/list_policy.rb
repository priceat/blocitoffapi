class ListPolicy < ApplicationPolicy
   def index?
    true
  end

  def show
    user.present?
  end

  def create?
    show?
  end

  def update?
    user.present?
  end

  def destroy?
    show?
  end
end