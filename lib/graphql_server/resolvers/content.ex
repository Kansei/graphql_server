defmodule GraphqlServer.Resolver.Content do
  alias GraphqlServer.Repo
  alias GraphqlServer.Todo

  def all(_args, _info) do
    {:ok, Repo.all(Todo)}
  end
end
