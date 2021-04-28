defmodule Flight.Bookings.AgentTest do
  use ExUnit.Case

  alias Flightex.Bookings.Agent, as: BookingAgent

  import Flightex.Factory

  describe "save/1" do
    test "saves the booking" do
      booking = build(:booking)

      BookingAgent.start_link()

      response = BookingAgent.save(booking)

      assert {:ok, _uuid} = response
    end
  end

  describe "get/1" do
    setup do
      BookingAgent.start_link()

      :ok
    end

    test "when the booking is found, returns the booking" do
      booking = build(:booking, id_usuario: "1")

      {:ok, uuid} = BookingAgent.save(booking)

      response = BookingAgent.get(uuid)

      expected_response =
        {:ok,
         %Flightex.Bookings.Booking{
           cidade_destino: "rio de janeiro",
           cidade_origem: "sao paulo",
           data_completa: "2000-01-01 23:00:07",
           id_usuario: "1"
         }}

      assert response == expected_response
    end

    test "when the booking is not found, returns an error" do
      response = BookingAgent.get("notfound")

      expected_response = {:error, "Flight Booking not found"}

      assert response == expected_response
    end
  end
end
