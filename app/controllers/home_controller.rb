class HomeController < ApplicationController
  require 'open-uri'

  def index
    reddit = RedditKit::Client.new 'readit-bot', 'readit-bot'
    
    @top_askreddit_link = reddit.links("AskReddit").first
  
    @top_comments = []
    reddit.comments(@top_askreddit_link).map{|c| @top_comments << c.body if !c.nil?}
    @top_comment_speech = open('http://tts-api.com/tts.mp3?q=' + CGI.escape(@top_comments[0]))
  end
end
