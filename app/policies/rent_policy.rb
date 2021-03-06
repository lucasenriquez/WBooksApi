class RentPolicy < ApplicationPolicy
  def create?
    user.present?
  end

  def index?
    return true if user.present? && user == rent[0].user
  end

  def destroy?
    return true if user.present? && user == rent[0].user
  end

  private

  def rent
    record
  end
end
