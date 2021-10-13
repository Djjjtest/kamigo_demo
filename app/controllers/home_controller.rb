class HomeController < ApplicationController
  include Kamigo::Clients::LineClient
  skip_before_action :verify_authenticity_token

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
    
    #if user_id == "Uca5cd5399cac936c1d3e7b3e4d06b0b7"
    if user_id == "abc"
      dices = [6]
    end

    @messsage = "你擲出的點數為：#{dices.sample}"
  end
  
  

  def fun_sloti1
    part1 = [
      "客戶那邊的",
      "我們的",
      "負責談需求的",
      "負責這個部分的",
      "直到上線前一天",
      "(雙手一攤)"
    ].sample
    
    part2 = [
      "主管",
      "工程師",
      "設計師",
      "外包",
      "ser",
      "聯絡窗口"
    ].sample

    part3 = [
      "當初沒有講清楚",
      "一直換",
      "說他肚子不舒服",
      "擺爛不想做了",
      "突然開始放長假",
      "去生小孩了",
      "離職了",
      "都沒甚麼sense",
      "都沒有跟我講",
      "以為這些不用做",
      "一直在狀況外",
      "做事拖拖拉拉",
      "還搞不清楚狀況",
      "Quality有問題",
      "東西一直改",
      "根本就是在整我",
      "突然就沒來了",
    ].sample
    @messsage = "#{part1}#{part2}#{part3}"
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

