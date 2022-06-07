module ApplicationHelper
  include Pagy::Frontend

  def nav_link path, name
    tag.li class: "nav-item" do
      link_to name, path, class: "nav-link"
    end
  end

  def avatar_full record
    img = record.avatar.file ? record.avatar.file.file.gsub(/(.+)(public)/, '') : "placeholder.png"
    image_tag img, id: record.id, class: "img-fluid rounded", alt: "#{record.name}'s avatar"
  end

  def avatar_thumb record, hash={}
    height = hash[:height] ? hash[:height] : 150
    img = record.avatar.thumb.file ? record.avatar.thumb.file.file.gsub(/(.+)(public)/, '') : "placeholder.png"
    image_tag img, alt: "#{record.name}'s avatar",
      class: "card__avatar__img rounded #{record.class.name.downcase}_#{record.id}", 
      style: "height:#{height}px; display: #{hash[:hidden] ? 'none' : 'block'}"
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
