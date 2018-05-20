# frozen_string_literal: true

module ApplicationHelper
  def string_to_date(str, datetime: false)
    return if str.blank?
    format = datetime ? "%Y-%m-%d %H:%M:%S" : "%Y-%m-%d"
    Date.strptime(str, format)
  rescue
    nil
  end

  def date_to_string(object, datetime: false)
    return if object.blank?
    format = datetime ? "%Y-%m-%d %H:%M:%S" : "%Y-%m-%d"
    object.strftime(format)
  rescue
    nil
  end
end
