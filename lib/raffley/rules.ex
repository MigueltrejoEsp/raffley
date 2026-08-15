defmodule Raffley.Rules do
  def list_rules do
    [
      %{id: 1, text: "Participants must have a high tolerance for puns and dad jokes"},
      %{id: 2, text: "Winner must do a victory prize when claiming their prize"},
      %{id: 3, text: "Have fun"}
    ]
  end

  def get_rule(id) when is_integer(id) do
    Enum.find(list_rules(), fn n -> n.id == id end)
  end

  def get_rule(id) when is_binary(id) do
    String.to_integer(id) |> get_rule()
  end
end
