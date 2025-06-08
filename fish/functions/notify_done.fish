function notify_done --on-event fish_postexec
    if test "$CMD_DURATION" -lt 5000
        return
    end
    afplay /System/Library/Sounds/Glass.aiff
end

