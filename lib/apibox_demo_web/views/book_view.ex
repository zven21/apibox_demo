defmodule ApiboxDemoWeb.BookView do
  use ApiboxDemoWeb, :view
  alias ApiboxDemoWeb.BookView

  def render("index.json", %{books: books, paginate: paginate}) do
    %{success: true, data: render_many(books, BookView, "book.json"), paginate: paginate}
  end

  def render("show.json", %{book: book}) do
    %{success: true, data: render_one(book, BookView, "book.json")}
  end

  def render("book.json", %{book: book}) do
    %{id: book.id, title: book.title, desc: book.desc, price: book.price}
  end
end
