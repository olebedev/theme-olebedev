function git_status
  if git_is_repo
    if git_is_touched
      echo -ns "$magenta_color$dirty_glyph$rest_color "
    else
      echo -ns "$cyan_color$none_glyph$rest_color "
    end
  end
end

function dir
  set -l cwd

  if test "$theme_short_path" = 'yes'
    set cwd (basename (set_color --bold black prompt_pwd))
  else
    set cwd (prompt_pwd)
  end
  if git_is_repo
    if test "$theme_short_path" = 'yes'
      set root_folder (command git rev-parse --show-toplevel 2>/dev/null)
      set parent_root_folder (dirname $root_folder)
      set cwd (echo $PWD | sed -e "s|$parent_root_folder/||")
    end
  end
  echo -ns "$cwd "
end

function _git_branch
  set -l gb
  if git_is_repo
    if test "$theme_short_path" = 'yes'
      set root_folder (command git rev-parse --show-toplevel 2>/dev/null)
      set parent_root_folder (dirname $root_folder)
      set cwd (echo $PWD | sed -e "s|$parent_root_folder/||")
    end
    set gb "$brmagenta_color$branch_glyph"$brblack_color (git_branch_name)$rest_color
    echo -ns "$gb "
  else
    echo
  end
end

function nix_is_shell -S -d 'Display current nix environment'
  [ -n "$IN_NIX_SHELL" ]
end

function nix_prompt
  if nix_is_shell
    echo (set_color --bold 2aa198)"$nix_glyph$rest_color "
  else
    echo
  end 
end

function fish_prompt -d 'oleg''s theme, a fish theme optimized for minimal soft look'
  # Save the last status for later (do this before anything else)
  set -l last_status $status

  set -x cyan_color      (set_color 2aa198)
  set -x rest_color      (set_color normal)
  set -x magenta_color   (set_color d33682)
  set -x brmagenta_color (set_color 6c71c4)
  set -x brblack_color   (set_color 002b36)
  set -x green_color     (set_color 859900)

  set -x branch_glyph    @
  # set -x nix_glyph       "$rest_color"($HOME/go/bin/imgcat -height 40px https://raw.githubusercontent.com/buildkite/emojis/main/img-buildkite-64/nix.png)"  "
  # set -x p_parrot_glyph  "$rest_color"($HOME/go/bin/imgcat -height 40px https://raw.githubusercontent.com/buildkite/emojis/main/img-buildkite-64/partyparrot.gif)"     "
  # set -x nix_glyph       \uf313" ($IN_NIX_SHELL)"
  set -l logo_glyph      "▲"
  set -x dirty_glyph     "✖"
  set -x none_glyph      "✔"

  set -l logo
  if [ $last_status -ne 0 ]
    set logo             (set_color --bold d33682)"$logo_glyph$rest_color "
  else
    set logo             "$cyan_color$logo_glyph$rest_color "
  end

  set -l cwd             (dir)(_git_branch)
  set -l git             (git_status)
  set -l nix             (nix_prompt)

  echo -ns "$logo$cwd$git$nix"
end
