defmodule Flightex.Bookings.Booking do
  @keys [:id_usuario, :data_completa, :cidade_origem, :cidade_destino]
  @enforce_keys @keys

  defstruct @keys

  def build(data_completa, cidade_origem, cidade_destino, id_usuario) do
    {:ok,
     %__MODULE__{
       id_usuario: id_usuario,
       data_completa: data_completa,
       cidade_origem: cidade_origem,
       cidade_destino: cidade_destino
     }}
  end
end
