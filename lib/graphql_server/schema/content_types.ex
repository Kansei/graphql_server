defmodule GraphqlServer.Schema.ContentTypes do
  use Absinthe.Schema.Notation

  object :todo do
    field(:id, :id)
    field(:title, :string)
    field(:check, :boolean)
  end
end
