require_dependency "retention_magic/application_controller"

module RetentionMagic
  class GraphsController < ApplicationController
    def index
      # RetentionMagic configuration setup
      @user_class = RetentionMagic.user_class.constantize


      first_user = @user_class.order(:created_at).first
      first_cohort = @first_user.created_at.beginning_of_month
      today = Date.today

      # For presenting the widgets
      @first_cohort_label = first_cohort.strftime("%h %Y")
      @current_cohort_label = today.strftime("%h %Y")
      @number_of_months = (today.year * 12 + today.month) - (first_cohort.year * 12 + first_cohort.month)

      @graphs = {
        activation: {
          signup_without_activation: {},
          one_activation: {},
          five_activations: {},
        },
        retention: {}
      }

      retention_models = RetentionMagic.retention_models.map { |class_name| class_name.constantize }
      activation_fields_for_query = RetentionMagic.activation_counter_columns.join(" + ")

      0.upto(@number_of_months - 1) do |month|
        cohort_start = @first_user.created_at.beginning_of_month + month.months
        cohort_start_end = (cohort_start + 1.month).beginning_of_month

        cohort_users = @user_class.where(created_at: cohort_start..cohort_start_end)

        @graphs[:activation][:signup_without_activation][cohort_start] = cohort_users.where("#{activation_fields_for_query} = 0").count
        @graphs[:activation][:one_activation][cohort_start] = cohort_users.where("#{activation_fields_for_query} = 1").count
        @graphs[:activation][:five_activations][cohort_start] = cohort_users.where("#{activation_fields_for_query} >= 5").count

        cohort_start_label = cohort_start.strftime("%h %y")
        @graphs[:retention][cohort_start_label] = {}
        cohort_user_ids = cohort_users.pluck(:id)

        -1.upto((Date.today.year * 12 + Date.today.month) - (cohort_start.year * 12 + cohort_start.month) - 1) do |month|
          retention_month = (cohort_start + month.months).beginning_of_month
          retention_month_end = (retention_month + 1.month).beginning_of_month

          records_per_user = {}

          retention_models.each do |model|
            count_per_user = model.where(user_id: cohort_user_ids).where(created_at: retention_month..retention_month_end).group("user_id").count
            count_per_user.each do |uid, count|
              records_per_user[uid] ||= 0
              records_per_user[uid] += count
            end
          end

          @graphs[:retention][cohort_start_label][retention_month] = records_per_user.keys.size
        end
      end


    end
  end
end
