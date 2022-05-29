module ApplicationHelper
  def nav_link path, name
    tag.li class: "nav-item" do
      link_to name, path, class: "nav-link"
    end
  end

  def avatar_full record
    image_tag(
      record.avatar.file.file.gsub(/(.+)(public)/, ''), 
      class: "img-fluid", alt: "#{record.name}'s avatar"
    ) if record.avatar.file
  end

  def no_nsfw_without_login game
    if current_user && game.nsfw
      true
    elsif !game.nsfw
      true
    else
      false
    end
  end
end
