class ReviewsController < ApplicationController
    def create
        # movie_id because of nested route
        @movie = Movie.find(params[:movie_id])
        # build sets the movie_id foreign key automatically
        @review = @movie.reviews.build(review_params)
        
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
        previous_review = Review.where(:movie_id => params[:movie_id], :moviegoer_id => current_moviegoer.id).first
        if previous_review
            redirect_to edit_movie_review_path(@movie, previous_review.id)
        end
        # new sets movie_id foreign key automatically
        @review ||= @movie.reviews.new
        @review = @review || @movie.reviews.new
    end

    def index
        @movie = Movie.find(params[:movie_id])
        if params[:asc] == "true" ; @ordering = :asc ; else @ordering = :desc ; end
        @reviews = Review.where(:movie_id => params[:movie_id]).joins(:moviegoer).order(potatoes: @ordering)
    end

    def edit
        @movie = Movie.find(params[:movie_id])
        @review = Review.where(:movie_id => params[:movie_id], :moviegoer_id => current_moviegoer.id).first
        unless @review
            redirect_to new_movie_review_path(@movie)
        end
    end
    
    def update
        @review = Review.where(:movie_id => params[:movie_id], :moviegoer_id => current_moviegoer.id).first
        @review.update_attributes!(review_params)
        flash[:notice] = 'Review successfully updated.'
        redirect_to movie_reviews_path
    end

    private
    def review_params
        params.require(:review).permit(:potatoes, :comments, :moviegoer_id, :movie_id)
    end
end
