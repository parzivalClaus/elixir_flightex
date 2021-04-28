defmodule Flightex.Bookings.Booking do
  alias Flightex.Users.User

  @keys [:id, :id_usuario, :data_completa, :cidade_origem, :cidade_destino]
  @enforce_keys [:id_usuario, :cidade_origem, :cidade_destino]

  defstruct @keys

  # def build(
  #       %User{id: id},
  #       cidade_origem,
  #       cidade_destino
  #     ) do
  #   {:ok,
  #    %__MODULE__{
  #      id: UUID.uuid4(),
  #      id_usuario: id,
  #      data_completa: NaiveDateTime.local_now(),
  #      cidade_origem: cidade_origem,
  #      cidade_destino: cidade_destino
  #    }}
  # end

  #   def build(_id_usuario, _data_completa, _cidade_origem, _cidade_destino),
  #     do: {:error, "Invalid parameters"}
end
