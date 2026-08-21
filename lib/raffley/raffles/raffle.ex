defmodule Raffley.Raffles.Raffle do
  use Ecto.Schema
  import Ecto.Changeset

  schema "raffles" do
    field :prize, :string
    field :description, :string
    field :ticket_price, :integer, default: 1
    field :status, Ecto.Enum, values: [:open, :upcoming, :closed], default: :upcoming
    field :image_path, :string, default: "/images/placeholder.jpg"

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(raffle, attrs) do
    raffle
    |> cast(attrs, [:prize, :description, :ticket_price, :status, :image_path])
    |> validate_required([:prize, :description, :ticket_price, :status, :image_path])
  end
end
