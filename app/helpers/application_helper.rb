module ApplicationHelper

  def bootstrap_class_for(flash_type)
    {
      success: "alert-success",
      error: "alert-danger",
      alert: "alert-warning",
      notice: "alert-info"
    }.stringify_keys[flash_type.to_s] || flash_type.to_s
  end

  def has_error(form, field)
    "<div class='invalid-feedback error'>#{field.to_s.titleize} #{form.errors[field].first}</div>".html_safe if form && form.errors && form.errors.include?(field)
  end

end
