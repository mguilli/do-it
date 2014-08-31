  class ApplicationPolicy

    class Scope
      attr_reader :user, :scope

      def initialize(user, scope)
        # raise Pundit::NotAuthorizedError, "Must be logged in." unless user
        @user = user
        @scope = scope
      end

      def resolve
        if user
          scope.where(user_id: user)
        end
      end
    end

    attr_reader :user, :record

    def initialize(user, record)
      raise Pundit::NotAuthorizedError, "Must be logged in." unless user
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

