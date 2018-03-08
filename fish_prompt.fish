# name: Nith

function _git_branch_name
  echo (command git symbolic-ref HEAD ^/dev/null | sed -e 's|^refs/heads/||')
end

function _is_git_dirty
  echo (command git status -s --ignore-submodules=dirty ^/dev/null)
end

function _git_prompt
  set_color 
  if [ (_git_branch_name) ]
    set -l git_branch (_git_branch_name)

    if [ (_is_git_dirty) ]
      set git_info (set_color $turquoise) $git_branch (set_color $orange) " *"
    else
      set git_info (set_color $turquoise) $git_branch
    end
    echo -n -s $git_info (set_color normal)
  end
end

function fish_prompt
  set -g purple af5fff
  set -g orange d75f00
  set -g limegreen 87ff00
  set -g turquoise 5fd7ff

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

  # Git prompt setup
  printf ' (%s)' (_git_prompt)

  # Line 2
  echo
  if test $VIRTUAL_ENV
      printf "(%s) " (set_color blue)(basename $VIRTUAL_ENV)(set_color normal)
  end
  printf '$ '
  set_color normal
end

