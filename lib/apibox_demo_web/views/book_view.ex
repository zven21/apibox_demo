defmodule ApiboxDemoWeb.BookView do
  use ApiboxDemoWeb, :view
  alias ApiboxDemoWeb.BookView

  def render("index.json", %{books: books}) do
    %{data: render_many(books, BookView, "book.json")}
  end

  def render("show.json", %{book: book}) do
    %{data: render_one(book, BookView, "book.json")}
  end

  def render("book.json", %{book: book}) do
    %{id: book.id, title: book.title, desc: book.desc, price: book.price}
  end
end
