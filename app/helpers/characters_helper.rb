module CharactersHelper

  def show_path char, hash
    if request.path.include?('games')
      game_character_path(char, game_id: char.game_id, **hash)
    elsif request.path.include?('users')
      user_character_path(char, user_id: char.user_id, **hash)
    end
  end

  def char_back char
    if request.path.include?('users')
      link_to "Back to User", user_characters_path(char, user_id: char.user_id), class: 'btn btn-primary mx-2'
    elsif request.path.include?('games')
      link_to "Back to Game", game_characters_path(char, game_id: char.game_id), class: 'btn btn-primary mx-2'
    end
  end

  def active_tab_link i, tab, params
    if params[:tab]
      if tab == params[:tab]
        'active'
      end
    elsif i == 0 
      'active'
    end
  end
end
