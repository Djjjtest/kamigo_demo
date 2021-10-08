class VideosController < ApplicationController
  def index
    @videos = [
      {
        "標題": "Day1 - 你適合觀看本系列教學影片嗎？",
        "影片網址": "https://www.youtube.com/watch?v=45BYBlfkSEo",
        "縮圖網址": "https://i.ytimg.com/vi/45BYBlfkSEo/hqdefault.jpg",
      },
      {
        "標題": "Day2 - 建立 LINE 官方帳號並完成基本設定",
        "影片網址": "https://www.youtube.com/watch?v=fz8T9Y4fqGY",
        "縮圖網址": "https://i.ytimg.com/vi/fz8T9Y4fqGY/hqdefault.jpg",
      },
      {
        "標題": "Day3 - LINE 官方帳號聊天模式",
        "影片網址": "https://www.youtube.com/watch?v=tb_r8edPy-E",
        "縮圖網址": "https://i.ytimg.com/vi/tb_r8edPy-E/hqdefault.jpg",
      },
    ]

    @keyword = params[:keyword]

    if @keyword.present?
      filtered_videos = []
      @videos.each do |video|
        if video[:標題].include? @keyword
          filtered_videos << video
        end
      end

      @videos = filtered_videos
    end
  end
end