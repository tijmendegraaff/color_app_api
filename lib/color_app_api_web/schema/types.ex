defmodule ColorAppApiWeb.Schema.Types do
  use Absinthe.Schema.Notation

  alias ColorAppApiWeb.Schema.Types

  # import your types
  import_types(Types.UserType)
  import_types(Types.SessionType)
  import_types(Types.PaletteType)
  import_types(Types.ColorType)
end
