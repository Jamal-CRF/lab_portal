module ApplicationHelper
  def doctor?
    current_user&.doctor?
  end

  def navbar_links
    if current_user.present?
      link_to "Exames", exames_path, class: "nav-link"
    else
      link_to "Login", new_user_session_path, class: "nav-link"
    end
  end
end
