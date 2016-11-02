module ApplicationHelper
  def flash_class flash_type
    {
      success: 'alert-success',
      error: 'alert-danger',
      alert: 'alert-warning',
      notice: 'alert-info'
    }[flash_type.to_sym] || flash_type.to_s
  end

  def gravatar_url(email, size)
    gravatar = Digest::MD5::hexdigest(email).downcase
    url = "http://gravatar.com/avatar/#{gravatar}.png?s=#{size}"
  end

  def status_css status
    {
      open: 'label-danger',
      in_progress: 'label-primary',
      finished: 'label-success'
    }[status.to_sym]
  end
end
