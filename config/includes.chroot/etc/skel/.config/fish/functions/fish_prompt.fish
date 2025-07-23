function fish_prompt
    echo (set_color brblue)(whoami)@(hostname) (set_color grey)(prompt_pwd --full-length-dirs 2) (set color normal) (fish_git_prompt)
    echo (set_color brred)'><>' (set_color normal)
end
