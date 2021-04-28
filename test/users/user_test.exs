defmodule Exlivery.Users.UsersTest do
  use ExUnit.Case

  alias Flightex.Users.User

  import Flightex.Factory

  describe "build/3" do
    test "when all parameters are valid, returns the user" do
      response =
        User.build(
          "Claudio",
          "cldgncvs91@gmail.com",
          "39949445892"
        )

      expected_response = {:ok, build(:user)}

      assert response == expected_response
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
