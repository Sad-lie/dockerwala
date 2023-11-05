defmodule Dockerwala.Books.Book do
  use Ecto.Schema
  import Ecto.Changeset

  schema "books" do
    field :data, :string
    field :title, :string
    field :author, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(book, attrs) do
    book
    |> cast(attrs, [:title, :author, :data])
    |> validate_required([:title, :author, :data])
  end
end
