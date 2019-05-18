defmodule ColorAppApiWeb.Schema.Types do
  use Absinthe.Schema.Notation

  alias ColorAppApiWeb.Schema.Types

  # import your types
  import_types(Types.UserType)
end
