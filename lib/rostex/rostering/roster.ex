defmodule Rostex.Rostering.Roster do
  use Ecto.Schema
  import Ecto.Changeset
  alias Rostex.Rostering.Roster


  schema "rosters" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(%Roster{} = roster, attrs) do
    roster
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
