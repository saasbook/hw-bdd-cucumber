class ReviewsController < ApplicationController
    before_filter :has_moviegoer_and_movie, :only => [:new, :create]
    protected

    def has_moviegoer_and_movie
      unless current_moviegoer
        flash[:warning] = 'You must be logged in to create a review.'
        redirect_to login_path
      end
      unless (@movie = Movie.find_by(:id => params[:movie_id]))
        flash[:warning] = 'Review must be for an existing movie.'
        redirect_to movies_path
      end
    end
    public
    def new
      @review = @movie.reviews.build
    end
    def create
      # since moviegoer_id is a protected attribute that won't get
      # assigned by the mass-assignment from params[:review], we set it
      # by using the << method on the association.  We could also
      # set it manually with review.moviegoer = @current_user.
      current_moviegoer.reviews << @movie.reviews.build(review_params)
      redirect_to movie_path(@movie)
    end

    def edit
      @movie = Movie.find_by(:id => params[:movie_id])
      @review = Review.find_by(:id => params[:id])
      # @movie.update_attributes!(movie_params)
      # flash[:notice] = "#{@movie.title} was successfully updated."
    end


    def update
      @review = Review.find_by(:id => params[:id])
      @review.update_attributes!(review_params)
      flash[:notice] = "Review was successfully updated."
      redirect_to movies_path
    end

    def destroy
      # @movie = Movie.find_by(:id => params[:movie_id])
      @review = Review.find_by(:id => params[:id])
      @review.destroy
      flash[:notice] = "Review has been deleted."
      redirect_to movies_path
    end

    private
    def review_params
        params.require(:review).permit(:potatoes,:comments,:moviegoer_id,:movie_id) # Replace with your actual permitted attributes
    end

  end