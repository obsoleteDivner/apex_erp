defmodule ApexErp.Account.Users do
    alias ApexErp.Repo
    alias ApexErp.Account.User

    def list_users(), do: Repo.all(User)

    def create_user(attrs) do
        %User{}
        |> User.changeset(attrs)
        |> Repo.insert()
    end
    
    def update_user(attrs) do
        %User{}
        |> User.changeset(attrs)
        |> Repo.update()
    end

    def get_user(user_uuid), do: Repo.get(User, user_uuid)

    def delete_users(%User{} = user), do: Repo.delete(user)


end