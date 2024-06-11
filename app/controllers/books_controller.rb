class BooksController < ApplicationController
  def index
    @book = Book.new
    @books = Book.all
  end

  def create
    @book = Book.new(book_params)
     if @book.save
    flash[:notice] = "Book was successfully destroyed."
    redirect_to book_path(@book.id)
    else
      flash[:notice] = "投稿に失敗しました。"
        render :new
    end
  end


  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

   def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end

   def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id)
  end

   private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
