defmodule Rostex.Rostering.Roster do
  use Ecto.Schema
  import Ecto.Changeset
  alias Rostex.Rostering.Roster


  schema "rosters" do
    field :name, :string
    belongs_to :organisation, Rostex.Organisations.Organisation

    timestamps()
  end

  @doc false
  def changeset(%Roster{} = roster, attrs) do
    roster
    |> cast(attrs, [:name, :organisation_id])
    |> validate_required([:name, :organisation_id])
  end
end
