defmodule GraphqlServer.Schema do
  use Absinthe.Schema
  import_types(GraphqlServer.Schema.ContentType)

  query do
    field :sll_todos, list_of(:todo) do
      resolve(&GraphqlServer.Resolver.Cotent.all/3)
    end
  end

  mutation do
    field :create_todo, :todo do
      arg(:title, non_null(:string))
      arg(:check, non_null(:boolean))
      resolve(&GraphqlServer.Resolver.Cotent.create_todo/2)
    end
  end
end
