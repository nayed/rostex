defmodule Rostex.Repo.Migrations.CreateOrganisations do
  use Ecto.Migration

  def change do
    create table(:organisations) do
      add :name, :string, null: false

      timestamps()
    end

    create table(:organisation_users) do
      add :organisation_id, references(:organisations, on_delete: :nothing), null: false
      add :user_id, references(:users, on_delete: :nothing), null: false
      add :relationship, :string, null: false

      timestamps()
    end

    # a user may only have at most 1 relationship with a given organisation
    unique_index(:organisation_users, [:organisation_id, :user_id], name: "organisations_users_unique_index")

    alter table(:rosters) do
      add :organisation_id, references(:organisations, on_delete: :nothing), null: false
    end
  end
end
