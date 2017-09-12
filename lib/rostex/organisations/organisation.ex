defmodule Rostex.Organisations.Organisation do
  use Ecto.Schema
  import Ecto.Changeset
  alias Rostex.Organisations.Organisation


  schema "organisations" do
    field :name, :string
    many_to_many :users, Rostex.Accounts.User, join_through: Rostex.Organisations.OrganisationUser

    timestamps()
  end

  @doc false
  def changeset(%Organisation{} = organisation, attrs) do
    organisation
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
