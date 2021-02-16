class EmployerVacancyPolicy < ::ApplicationPolicy

  def create?
    admin? || user.employer?
  end

  def new?
    super
  end

  #def update?
    #  admin? || !user.employer
    #end

  # def edit?
    #  super
    #end

  #def destroy?
    # admin? || !user.employer
    #end




end
