defmodule Flightex.Factory do
  use ExMachina

  alias Flightex.Bookings.Booking
  alias Flightex.Users.User

  def user_factory do
    %User{
      name: "Claudio",
      email: "cldgncvs91@gmail.com",
      cpf: "39949445892"
    }
  end

  def booking_factory do
    %Booking{
      id_usuario: UUID.uuid4(),
      data_completa: "2000-01-01 23:00:07",
      cidade_origem: "sao paulo",
      cidade_destino: "rio de janeiro"
    }
  end
end
