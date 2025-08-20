defmodule SopremaWeb.Layouts do
  @moduledoc """
  This module holds different layouts used by your application.

  See the `layouts` directory for all templates available.
  The "root" layout is a skeleton rendered as part of the
  application router. The "app" layout is set as the default
  layout on both `use SopremaWeb, :controller` and
  `use SopremaWeb, :live_view`.
  """
  use SopremaWeb, :html

  embed_templates "layouts/*"
end
