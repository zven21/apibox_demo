# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     ApiboxDemo.Repo.insert!(%ApiboxDemo.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias ApiboxDemo.Books.Book
alias ApiboxDemo.Repo

1..100
|> Enum.map(fn x ->
  Repo.insert(%Book{
    title: Faker.String.base64(),
    price: Faker.random_between(1, 1000)
  })
end)
