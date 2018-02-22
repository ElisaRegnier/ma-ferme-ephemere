class BookingPolicy < ApplicationPolicy
  def index?
    record.user == user
  end

  def show?
    true
  end

  def new?
    true
  end

  def create?
    record.user == user
  end

  def accept?
    record.farm.user == user
  end

  def decline?
    record.farm.user == user
  end

  def destroy?
    record.user == user
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
