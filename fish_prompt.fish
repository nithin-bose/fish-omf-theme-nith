# name: Nithin
function fish_prompt
  set -l purple af5fff
  set -l orange d75f00
  set -l limegreen 87ff00

  echo ""
  set_color $purple
  printf '%s' (whoami)
  set_color normal
  printf ' at '

  set_color $orange
  printf '%s' (hostname|cut -d . -f 1)
  set_color normal
  printf ' in '

  set_color $limegreen
  set -g fish_prompt_pwd_dir_length 0
  printf '%s' (prompt_pwd)
  set_color normal
  printf '%s' (__fish_git_prompt)

  # Line 2
  echo
  if test $VIRTUAL_ENV
      printf "(%s) " (set_color blue)(basename $VIRTUAL_ENV)(set_color normal)
  end
  printf '$ '
  set_color normal
end

