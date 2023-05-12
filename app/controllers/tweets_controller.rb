# encoding: utf-8
class TweetsController < ApplicationController
    before_action :require_user_logged_in!
    before_action :set_tweet, only: [:show, :edit, :update, :destroy]
    def new
        @newtweet = NewTweet.new
        @newtweet.user = Current.user
    end

    def index
        @newtweets = NewTweet.all
        @users = User.all
    end

    def create 
        @newtweet = NewTweet.new(tweet_params)
        if @newtweet.save
            redirect_to tweets_path, notice: 'Пост успешно опубликован.'
        else
            render :new
        end
    end

    def edit
    end

    def update
        @newtweet.update(tweet_params)
        redirect_to tweets_path, notice: 'Пост успешно изменён.'
    end

    def destroy
        @newtweet.destroy
        redirect_to tweets_path, notice: 'Пост успешно удалён.'
    end

    private
    def tweet_params
        params.require(:new_tweet).permit(:user, :body, :avatar,)
    end

    def set_tweet
        @newtweet = NewTweet.find(params[:id])
    end
end
