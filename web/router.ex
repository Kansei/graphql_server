defmodule GraphqlServer.Router do
  use GraphqlServer.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", GraphqlServer do
    pipe_through :api

    forward(
      "/",
      Absinthe.Plug,
      schema: GraphqlServer.Schema
    )

    forward(
      "/graphiql",
      Absinthe.Plug.GraphiQL,
      schema: GraphqlServer.Schema,
      interface: :simple,
      context: %{pubsub: GraphqlServer.Endpoint}
    )
#
    # get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", GraphqlServer do
  #   pipe_through :api
  # end
end
