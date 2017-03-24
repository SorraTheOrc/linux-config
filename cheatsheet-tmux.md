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

### Resizing

PREFIX : resize-pane -D (Resizes the current pane down)
PREFIX : resize-pane -U (Resizes the current pane upward)
PREFIX : resize-pane -L (Resizes the current pane left)
PREFIX : resize-pane -R (Resizes the current pane right)
PREFIX : resize-pane -D 20 (Resizes the current pane down by 20 cells)
PREFIX : resize-pane -U 20 (Resizes the current pane upward by 20 cells)
PREFIX : resize-pane -L 20 (Resizes the current pane left by 20 cells)
PREFIX : resize-pane -R 20 (Resizes the current pane right by 20 cells)
PREFIX : resize-pane -t 2 20 (Resizes the pane with the id of 2 down by 20 cells)
PREFIX : resize-pane -t -L 20 (Resizes the pane with the id of 2 left by 20 cells)

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
