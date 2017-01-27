# TMux Cheatsheet

## Help

Help:          `Ctrl + b ?`

## Sessions

New session:   `tmux new -s name`
Attach:        `tmux a`

## Windows

Create:        `Ctrl + b c`
Rename:        `Ctrl + b ,`
Close:         `Ctrl + b &`
Next:          `Ctrl + b n`
Previous:      `Ctrl + b p`
Switch:        `Ctrl + b 0..9`

## Panes

Split vertically:   `Ctrl + b %`
Split Horizontally: `Ctrl + b "`
Show pane numbers:  `Ctrl + b q [0..9]`
Toggle zoom:        `Ctrl + b z`
Convert pane:       `Ctrl + b !`
Toggle layouts:     `Ctrl + b SPACE`
Next:               `Ctrl + b o`
Close:              `Ctrl + b x`

## Copy mode

Enter copy mode:    `Ctrl + b [`
Quit mode:          `q`
Search forward:     `/`
Search backward:    `?`
Next result:        `n`
Previous result:    `N`
Start selection:    `SPACE`
Forward one word:   `w`
Backward one word:  `b`
Clear selection:    `ESC`
Copy selection:     `ENTER`
Paste buffer:     `Ctrl + b ]`

http://tmuxcheatsheet.com/
