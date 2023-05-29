module ApplicationHelper
  def doctor?
    current_user&.doctor?
  end

  def navbar_links
    link_to "Exames", exames_path, class: "nav-link" if current_user.present?
  end
end
