class TaskPolicy < ApplicationPolicy
  def create?
    user.present?
  end
  def destroy?
    create?
  end
  def update?
    create?
  end

end