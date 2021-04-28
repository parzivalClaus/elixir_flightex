defmodule Flightex.Users.User do
  @keys [:id, :name, :email, :cpf]
  @enforce_keys [:name, :email, :cpf]

  defstruct @keys

  def build(name, email, cpf) do
    %__MODULE__{
      name: name,
      email: email,
      cpf: cpf,
      id: UUID.uuid4()
    }
  end

  def build(_id, _name, _email, _cpf), do: {:error, "Invalid parameters"}
end
