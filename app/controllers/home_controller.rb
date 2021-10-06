class HomeController < ApplicationController
  include Kamigo::Clients::LineClient

  # before_action :authenticate_user
  def share_bot
  end

  def share_bot_flex
  end

  def member_join
    @profiles = params.dig(:payload, :joined, :members).map{|member| get_profile(member.dig(:userId)) }
  end

  def draw_dice
    user_id = params.dig(:source_user_id)
    dices = [1, 2, 3, 4, 5, 6]
    
    if user_id == "Uca5cd5399cac936c1d3e7b3e4d06b0b7"
      dices = [6]
    end

    @messsage = "你擲出的點數為：#{dices.sample}"
  end
  
  private

  def get_profile(user_id)
    case params[:source_type]
    when 'group'
      response = client.get_group_member_profile(
        params[:source_group_id],
        user_id
      )
    when 'room'
      response = client.get_room_member_profile(
        params[:source_group_id],
        user_id
      )
    else
      response = client.get_profile(user_id)
    end
    JSON.parse(response.body)
  end
end

