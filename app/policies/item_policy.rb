class ItemPolicy < ApplicationPolicy

  def show?
    false   
  end

  def index?
    # (record.user == user)
    # true
    # user_owned?
    false
  end

  private

  def user_owned?
    user.present? && (record.list.user == user)
  end

end