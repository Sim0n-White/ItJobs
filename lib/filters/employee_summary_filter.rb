module Filters
  class EmployeeSummaryFilter < Base

    filter :id do |scope, id|
      scope.where(id: id)
    end

    filter :country_id do |scope, country_id|
      scope.where(country_id: country_id)
    end

    filter :city_id do |scope, city_id|
      scope.where(city_id: city_id)
    end

    filter :schedule_id do |scope, schedule_id|
      scope.where(schedule_id: schedule_id)
    end

    filter :code_language_id do |scope, code_language_id|
      scope.where(code_language_id: code_language_id)
    end

    def base_scope
      @scope ||= employee_summary_query
    end

    def available_params
      %i[id country_id city_id schedule_id code_language_id]
    end

    def employee_summary_query
      @employee_summary_query ||= EmployeeSummary.all
    end

  end
end
