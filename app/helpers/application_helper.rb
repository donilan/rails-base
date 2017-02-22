module ApplicationHelper

  def paginate objects, options = {}
    options.reverse_merge!( theme: 'twitter-bootstrap-3' )
    super( objects, options )
  end

  def alert_class(type)
    case type
    when "error", 'alert'
      return "alert-danger"
    when 'success'
      return "alert-success"
    when 'info', "notice"
      return 'alert-info'
    when 'warning'
      return "alert-warning"
    else
      Rails.logger.error "flash type '#{type}' not avaliable, please use one of 'error', 'success', 'info' or 'notice'"
    end
  end
end
