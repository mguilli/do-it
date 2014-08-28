class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    user_owned?
  end

  def show?
    scope.where(:id => record.id).exists?
    user_owned?
  end

  def create?
    user_owned?
  end

  def new?
    create?
  end

  def update?
    user_owned?
  end

  def edit?
    update?
  end

  def destroy?
    user_owned?
  end

  def scope
    record.class
  end

  private

  def user_owned?
    user.present? && (record.user == user)
  end
end

