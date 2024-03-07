defmodule Icy.User do
  alias Ecto.Changeset
  use Ecto.Schema

  @required_fields [:role]

  embedded_schema do
    field :role, :string, default: "admin"
  end

  def changeset(user \\ %__MODULE__{}, changes) do
    user
    |> Changeset.cast(changes, @required_fields)
    |> Changeset.validate_required(@required_fields)
  end
end
