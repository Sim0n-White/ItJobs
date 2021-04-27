module Search
  class EmployeeSummaryFinder < Finder

    def initialize(params, session)
      super(params, session)
    end

    protected

    def collection_by_filter
      @collection = EmployeeSummary.filtered_by(@params[:filter], nil, 'EmployerVacancy')
    end

    def filter_fields
      %i[
        country_id
        city_id
        schedule_id
        code_language_id
      ]
    end

  end
end
