class ItemPolicy < ApplicationPolicy

  def show?
    false   
  end

  private

  def user_owned?
    user.present? && (record.list.user == user)
  end

end