defmodule Dockerwala.BooksTest do
  use Dockerwala.DataCase

  alias Dockerwala.Books

  describe "books" do
    alias Dockerwala.Books.Book

    import Dockerwala.BooksFixtures

    @invalid_attrs %{data: nil, title: nil, author: nil}

    test "list_books/0 returns all books" do
      book = book_fixture()
      assert Books.list_books() == [book]
    end

    test "get_book!/1 returns the book with given id" do
      book = book_fixture()
      assert Books.get_book!(book.id) == book
    end

    test "create_book/1 with valid data creates a book" do
      valid_attrs = %{data: "some data", title: "some title", author: "some author"}

      assert {:ok, %Book{} = book} = Books.create_book(valid_attrs)
      assert book.data == "some data"
      assert book.title == "some title"
      assert book.author == "some author"
    end

    test "create_book/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Books.create_book(@invalid_attrs)
    end

    test "update_book/2 with valid data updates the book" do
      book = book_fixture()
      update_attrs = %{data: "some updated data", title: "some updated title", author: "some updated author"}

      assert {:ok, %Book{} = book} = Books.update_book(book, update_attrs)
      assert book.data == "some updated data"
      assert book.title == "some updated title"
      assert book.author == "some updated author"
    end

    test "update_book/2 with invalid data returns error changeset" do
      book = book_fixture()
      assert {:error, %Ecto.Changeset{}} = Books.update_book(book, @invalid_attrs)
      assert book == Books.get_book!(book.id)
    end

    test "delete_book/1 deletes the book" do
      book = book_fixture()
      assert {:ok, %Book{}} = Books.delete_book(book)
      assert_raise Ecto.NoResultsError, fn -> Books.get_book!(book.id) end
    end

    test "change_book/1 returns a book changeset" do
      book = book_fixture()
      assert %Ecto.Changeset{} = Books.change_book(book)
    end
  end
end
