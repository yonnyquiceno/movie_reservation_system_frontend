module ApplicationHelper
  def flash_class(level)
    level = case level
      when :notice then "alert-info"
      when :success then "alert-success"
      when :error then "alert-warning"
      when :alert then "alert-warning"
    end
    "alert alert-dismissible fade show " + level
  end

  def resolve_date
    params[:movie].try(:[], 'date') || Date.today
  end
end
