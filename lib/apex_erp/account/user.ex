defmodule ApexErp.Account.User do
    use Ecto.Schema
    import Ecto.Changeset
    

    @primary_key {:uuid, :binary_id, autogenerate: true}

    schema "users" do
        field :first_name,    :string
        field :last_name,     :string
        field :avatar,        :string
        field :password,      :string
        field :email,         :string
        field :gender,        :string
        field :phone,         :string
        field :role,          :string
        field :position,      :string
    end

    def changeset(user, params \\ %{}) do
        user
        |> cast(params, [
            :first_name,
            :last_name,
            :avatar,
            :password,
            :email,
            :gender,
            :phone,
            :role,
            :position
          ])
    end
end