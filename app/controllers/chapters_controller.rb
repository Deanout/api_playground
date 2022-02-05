class ChaptersController < ApplicationController
  before_action :set_chapter, only: %i[show update destroy]

  # GET /chapters
  def index
    @chapters = Chapter.all

    render json: @chapters
  end

  # GET /chapters/1
  def show
    render json: @chapter
  end

  # POST /chapters
  def create
    @chapter = find_or_create_book_for_chapter

    if @chapter.save
      render json: @chapter, status: :created, location: @chapter
    else
      render json: @chapter.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /chapters/1
  def update
    if @chapter.update(chapter_params)
      render json: @chapter
    else
      render json: @chapter.errors, status: :unprocessable_entity
    end
  end

  # DELETE /chapters/1
  def destroy
    @chapter.destroy
  end

  private

  # Creates a book if one does not already exist for this chapter
  # then returns the chapter.
  def find_or_create_book_for_chapter
    chapter = Chapter.new(chapter_params)

    id_was_not_provided = params[:chapter][:book_id].nil?
    if id_was_not_provided
      create_book_for_chapter(chapter)
    else
      chapter.book = Book.find_or_create_by(id: params[:chapter][:book_id]) do |book|
        book.author = chapter_params[:author]
      end
    end
    chapter
  end

  # Create a new book for the chapter.
  def create_book_for_chapter
    book = Book.create(author: chapter_params[:author])
    chapter = Chapter.new(chapter_params)
    chapter.book = book
    chapter
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_chapter
    @chapter = Chapter.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def chapter_params
    params.require(:chapter).permit(:name, :body, :author, :book_id)
  end
end
