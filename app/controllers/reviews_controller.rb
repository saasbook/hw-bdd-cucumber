class ReviewsController < ApplicationController
    def create
        # movie_id because of nested route
        @movie = Movie.find(params[:movie_id])
        # build sets the movie_id foreign key automatically
        @review = @movie.reviews.build(params[:review])
        
        if @review.save
            flash[:notice] = 'Review successfully created.'
            redirect_to(movie_reviews_path(@movie))
        else
            render :action => 'new'
        end
    end

    def new
        # movie_id because of nested route
        @movie = Movie.find(params[:movie_id])
        # new sets movie_id foreign key automatically
        @review ||= @movie.reviews.new
        @review = @review || @movie.reviews.new
    end
end
