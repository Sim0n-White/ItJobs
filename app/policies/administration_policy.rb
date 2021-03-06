class AdministrationPolicy < ::ApplicationPolicy

  def unaccepted_vacancies?
    admin?
  end

  def unaccepted_summaries?
    admin?
  end

  def show_vacancy?
    admin?
  end

  def show_summary?
    admin?
  end

end
