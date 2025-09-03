#!/bin/bash
. "$HOME/.asdf/asdf.sh"
mix deps.get
mix compile
exec mix phx.server
