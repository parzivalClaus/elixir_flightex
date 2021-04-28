defmodule Flightex.Users.CreateOrUpdateTest do
  use ExUnit.Case

  alias Flightex.Users.Agent, as: UserAgent
  alias Flightex.Users.CreateOrUpdate
  alias Flightex.Users.User

  import Flightex.Factory

  describe "call/1" do
    setup do
      UserAgent.start_link()

      :ok
    end

    test "when all params are valid, saves the user" do
      params = build(:user)

      response = CreateOrUpdate.call(params)

      assert {:ok, _uuid} = response
    end

    test "when there are invalid parameters, returns an error" do
      response =
        User.build(
          "Claudio",
          "cldgncvs91@gmail.com",
          39_949_445_892
        )

      expected_response = {:error, "Invalid parameters"}

      assert response == expected_response
    end
  end
end
