defmodule Flightex.Bookings.CreateOrUpdateTest do
  use ExUnit.Case

  alias Flightex.Bookings.Agent, as: BookingAgent
  alias Flightex.Bookings.CreateOrUpdate
  alias Flightex.Users.Agent, as: UserAgent

  import Flightex.Factory

  describe "call/1" do
    setup do
      Flightex.start_agents()

      user = build(:user)

      {:ok, uuid} = UserAgent.save(user)

      {:ok, id_usuario: uuid}
    end

    test "when all params are valid, saves the booking", %{id_usuario: id_usuario} do
      params = build(:booking, id_usuario: id_usuario)

      response = CreateOrUpdate.call(params)

      assert {:ok, _uuid} = response
    end

    test "when there is no user with given id, returns an error", %{id_usuario: id_usuario} do
      params = build(:booking, id_usuario: nil)

      response = CreateOrUpdate.call(params)

      expected_response = {:error, "User not found"}

      assert response == expected_response
    end
  end
end
