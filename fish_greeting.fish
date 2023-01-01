function fish_greeting
  return
  set -x size 42px

  set -x nix_glyph ($HOME/go/bin/imgcat -height $size https://raw.githubusercontent.com/buildkite/emojis/main/img-buildkite-64/nix.png)
  set -x rust_glyph ($HOME/go/bin/imgcat -height $size https://raw.githubusercontent.com/buildkite/emojis/main/img-buildkite-64/rust.png)
  set -x go_glyph ($HOME/go/bin/imgcat -height $size https://raw.githubusercontent.com/buildkite/emojis/main/img-buildkite-64/golang.png)
  set -x partyparrot_glyph ($HOME/go/bin/imgcat -height $size https://raw.githubusercontent.com/buildkite/emojis/main/img-buildkite-64/partyparrot.gif)
  
  echo "# Do not forget to get maximum fun $partyparrot_glyph!"
  echo "#"
end
