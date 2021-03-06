class EmployeeSummaryPolicy < ::ApplicationPolicy

  def index?
    admin? || !user&.employer?
  end

  def create?
    admin? || !user&.employer?
  end

  def new?
    super
  end

  def show?
    admin? || (!user&.employer? && user_is_owner?)
  end

  def update?
    admin? || (!user&.employer? && user_is_owner?)
  end

  def edit?
    super
  end

  def accept?
    admin?
  end

  def reject?
    admin?
  end

  def destroy?
    admin? || (!user&.employer? && user_is_owner?)
  end

  private

  def user_is_owner?
    user == @record.user
  end

end
