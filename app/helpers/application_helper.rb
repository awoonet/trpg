module ApplicationHelper
  def nav_link path, name
    tag.li class: "nav-item" do
      link_to name, path, class: "nav-link"
    end
  end

  def avatar_full record
    image_tag(
      record.avatar.file.file.gsub(/(.+)(public)/, ''), 
      class: "img-fluid rounded", alt: "#{record.name}'s avatar"
    ) if record.avatar.file
  end

  def avatar_thumb record
    image_tag(record.avatar.thumb.file.file.gsub(/(.+)(public)/, ''),
      class: "card__avatar__img rounded",
      alt: "#{record.name}'s avatar",
      style: "height:150px;"
      )if record.avatar.thumb.file
  end

  def admin_access game, user
    user && (game.admins.include?(user.id) || user.is_admin)
  end

  def owner user, char
    user && (user.id == char.user_id)
  end

  def come_back params
    if !(params[:controller] == "users")
      link_to "Back to Game", game_path(Game.find params[:id]), class: 'btn btn-primary'

    elsif params[:action] == "edit"
      link_to "Back to User", user_path(User.find params[:id]), class: 'btn btn-primary'
    
    else
      ""

    end
  end
end
