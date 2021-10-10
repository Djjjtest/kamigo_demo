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
      {
        "標題": "Day4 - LINE 官方帳號自動回應",
        "影片網址": "https://www.youtube.com/watch?v=7EGBX3QsmhA",
        "縮圖網址": "https://i.ytimg.com/vi/7EGBX3QsmhA/hqdefault.jpg",
      },
      {
        "標題": "LINE Bot Day5 - LINE 官方帳號圖文選單",
        "影片網址": "https://www.youtube.com/watch?v=oc7yNStIeFs",
        "縮圖網址": "https://i.ytimg.com/vi/oc7yNStIeFs/hqdefault.jpg",
      },
    ]

    @keyword = params[:keyword]

    if @keyword.present?
      @videos.filter! do |video|
        video[:標題].include? @keyword
      end
    end

    @videos = @videos.first(4)
  end
end