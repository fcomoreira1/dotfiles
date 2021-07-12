# Defined interactively
function fish_prompt
    if not set -q VIRTUAL_ENV_DISABLE_PROMPT
        set -g VIRTUAL_ENV_DISABLE_PROMPT true
    end
    set_color cyan 
    printf '%s' $USER
    set_color normal
    printf ' at '

    set_color blue 
    echo -n (prompt_hostname)
    set_color normal
    printf ' in '

    set_color yellow 
    printf '%s' (prompt_pwd)
    set_color normal

    # Line 2
    echo
    if test -n "$VIRTUAL_ENV"
        printf "(%s) " (set_color blue)(basename $VIRTUAL_ENV)(set_color normal)
    end
    printf '↪ '
    set_color normal
end
