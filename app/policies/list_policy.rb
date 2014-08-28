class ListPolicy < ApplicationPolicy

  def new?
    user.present?
  end
end