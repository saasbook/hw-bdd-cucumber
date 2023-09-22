class MoviegoersController < ApplicationController
    def show
        @user = Moviegoer.find(params[:id])
    end

    def reviews
        @user = Moviegoer.find(params[:id])
        @reviews = @user.reviews.joins(:movie)
    end
end
