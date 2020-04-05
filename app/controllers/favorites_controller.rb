class FavoritesController < ApplicationController
  before_action :set_book

  def create
    # @favorite = current_user.favorites.new(book_id: book.id)
    # binding.pry
    # @favorite.save
    # redirect_back(fallback_location: root_path)

    @favorite = Favorite.create(user_id: current_user.id, book_id: @book.id)
  end

  def destroy
    # @favorite = Favorite.find_by(user_id: current_user.id, book_id: params[:book_id])
    # @favorite.destroy
    # redirect_back(fallback_location: root_path)

    @favorite = Favorite.find_by(user_id: current_user.id, book_id: @book.id)
    @favorite.destroy
  end

  private
    def set_book
      @book = Book.find(params[:book_id])
    end
end
