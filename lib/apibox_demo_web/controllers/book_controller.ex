defmodule ApiboxDemoWeb.BookController do
  use ApiboxDemoWeb, :controller

  alias ApiboxDemo.Books
  alias ApiboxDemo.Books.Book

  action_fallback ApiboxDemoWeb.FallbackController

  def index(conn, params) do
    result = Book |> Turbo.Ecto.turbo(params)
    render(conn, "index.json", books: result.entries, paginate: result.paginate)
  end

  def create(conn, %{"book" => book_params}) do
    with {:ok, %Book{} = book} <- Books.create_book(book_params) do
      conn
      |> put_status(:created)
      # |> put_resp_header("location", Routes.book_path(conn, :show, book))
      |> render("show.json", book: book)
    end
  end

  def show(conn, %{"id" => id}) do
    book = Books.get_book!(id)
    render(conn, "show.json", book: book)
  end

  def update(conn, %{"id" => id, "book" => book_params}) do
    book = Books.get_book!(id)

    with {:ok, %Book{} = book} <- Books.update_book(book, book_params) do
      render(conn, "show.json", book: book)
    end
  end

  def delete(conn, %{"id" => id}) do
    book = Books.get_book!(id)

    with {:ok, %Book{}} <- Books.delete_book(book) do
      send_resp(conn, :no_content, "")
    end
  end
end
