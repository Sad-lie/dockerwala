defmodule Dockerwala.BooksFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Dockerwala.Books` context.
  """

  @doc """
  Generate a book.
  """
  def book_fixture(attrs \\ %{}) do
    {:ok, book} =
      attrs
      |> Enum.into(%{
        author: "some author",
        data: "some data",
        title: "some title"
      })
      |> Dockerwala.Books.create_book()

    book
  end
end
