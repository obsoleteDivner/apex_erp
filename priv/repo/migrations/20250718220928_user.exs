defmodule ApexErp.Repo.Migrations.User do
  use Ecto.Migration

  def change do
    create table(:users, primary_key: false) do
      add :uuid,          :binary_id, primary_key: true
      add :first_name,    :string
      add :last_name,     :string
      add :avatar,        :string
      add :password,      :string
      add :email,         :string
      add :gender,        :string
      add :phone,         :string
      add :role,          :string
      add :position,      :string
    end
  end
end
