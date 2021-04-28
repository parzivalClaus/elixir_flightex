defmodule Flightex.Users.CreateOrUpdate do
  alias Flightex.Users
  alias Users.Agent, as: UserAgent
  alias Users.User

  def call(%{name: name, email: email, cpf: cpf}) do
    with {:ok, user} <- User.build(cpf, email, name) do
      UserAgent.save(user)
    else
      error -> error
    end
  end
end
