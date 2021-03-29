module Filterable
  extend ActiveSupport::Concern

  class_methods do
    def filtered_by(params = {}, scope = nil, additional_class = nil)
      filter_class = if polymorphic_name == 'Announcement'
                       "Filters::#{additional_class}Filter"
                     else
                       "Filters::#{polymorphic_name}Filter"
                     end
      filter_object = filter_class.constantize.new(scope)
      cleaned_params = params.delete_if { |_, v| v.blank? }
      permitted_params = hash_params(cleaned_params).symbolize_keys.extract!(*filter_object.available_params)
      permitted_params = clear_oxy_params(permitted_params, filter_object) unless filter_object.oxy_params.empty?

      filter_object.search(permitted_params)
    end

    private

    def hash_params(cleaned_params)
      cleaned_params.is_a?(Hash) ? cleaned_params : cleaned_params.permit!.to_h
    end

    def clear_oxy_params(permitted_params, filter_object)
      filter_object.oxy_params.each_pair do |key, value|
        permitted_params.delete(value) if permitted_params.key?(key)
      end

      permitted_params
    end
  end
end
