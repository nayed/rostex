defmodule Rostex.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Rostex.Accounts.User


  schema "users" do
    field :display_name, :string
    field :email, :string
    field :password, :string
    many_to_many :organisations, Rostex.Organisations.Organisation, join_through: Rostex.Organisations.OrganisationUser

    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:email, :display_name, :password])
    |> validate_required([:email, :display_name, :password])
    |> validate_format(:email, ~r/.+@.+\..+/, [message: "Please input an email"])
    |> unique_constraint(:email)
  end
end
