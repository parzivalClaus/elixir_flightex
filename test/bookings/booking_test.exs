defmodule Flightex.Bookings.BookingTest do
  use ExUnit.Case

  alias Flightex.Bookings.Booking

  describe "build/4" do
    test "when all params are valid, returns an booking" do
      response =
        Booking.build(
          "~N[2000-01-01 23:00:07]",
          "sao paulo 2",
          "rio de janeiro 2",
          "1"
        )

      expected_response = {
        :ok,
        %Flightex.Bookings.Booking{
          cidade_destino: "rio de janeiro 2",
          cidade_origem: "sao paulo 2",
          data_completa: "~N[2000-01-01 23:00:07]",
          id_usuario: "1"
        }
      }

      assert response == expected_response
    end

    test "when there is an invalid parameter, returns an error" do
      response =
        Booking.build(
          "~N[2000-01-01 23:00:07]",
          "sao paulo 2",
          "rio de janeiro 2",
          nil
        )

      expected_response = {:error, "Invalid parameters"}

      assert response == expected_response
    end
  end
end
