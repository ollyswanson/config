function fish_prompt
    if test -n "$SSH_TTY"
        echo -n (set_color $purple)"$USER"(set_color white)'@'(set_color pink)(prompt_hostname)' '
    end

    echo -n (set_color 88c0d0)(prompt_pwd)

    echo -n (set_color b48ead)(fish_vcs_prompt)' '
    set_color -o
    if test "$USER" = 'root'
        echo -n (set_color red)'# '
    end
    echo -n (set_color 88c0d0)'❯'(set_color c9826b)'❯'(set_color a3be8c)'❯ '
    set_color normal
end
