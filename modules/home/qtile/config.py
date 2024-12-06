# Copyright (c) 2010 Aldo Cortesi
# Copyright (c) 2010, 2014 dequis
# Copyright (c) 2012 Randall Ma
# Copyright (c) 2012-2014 Tycho Andersen
# Copyright (c) 2012 Craig Barnes
# Copyright (c) 2013 horsik
# Copyright (c) 2013 Tao Sauvage
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the 'Software'), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

import iwlib, subprocess
from os.path import expanduser
from dataclasses import dataclass

from libqtile import bar, layout, hook, qtile
from libqtile.config import Click, Drag, Group, ScratchPad, DropDown, Key, KeyChord, Match, Rule, Screen
from libqtile.lazy import lazy
from libqtile.utils import send_notification
from libqtile.command.base import expose_command
from libqtile.backend.base import Window

from qtile_extras import widget
from qtile_extras.widget import decorations

@hook.subscribe.startup_once
def autostart():
    qtile.spawn('startup')

@hook.subscribe.suspend
def activate_lockscreen():
    qtile.spawn('lockscreen')

@hook.subscribe.resume
def restart_picom():
    qtile.spawn("systemctl --user restart picom");

mod = 'mod4'
alt = 'mod1'

terminal = 'kitty'
discord = 'vesktop'
browser = 'floorp'
files = 'nemo'

keys = [
    # A list of available commands that caNintendo3ds.andKnuckles
    # n be bound to keys can be found
    # at https://docs.qtile.org/en/latest/manual/config/lazy.html
    
    # Switch between windows
    Key([mod], 'Left', lazy.layout.left(), desc='Move focus to left'),
    Key([mod], 'Right', lazy.layout.right(), desc='Move focus to right'),
    Key([mod], 'Down', lazy.layout.down(), desc='Move focus down'),
    Key([mod], 'Up', lazy.layout.up(), desc='Move focus up'),
    
    Key([mod, alt], 'Up', lazy.layout.next(), desc='Move window focus to next window'),
    Key([mod, alt], 'Down', lazy.layout.previous(), desc='Move window focus to previous window'),
    
    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, 'shift'], 'Left', lazy.layout.move_left(), desc='Move window to the left'),
    Key([mod, 'shift'], 'Right', lazy.layout.move_right(), desc='Move window to the right'),
    Key([mod, 'shift'], 'Down', lazy.layout.move_down(), desc='Move window down'),
    Key([mod, 'shift'], 'Up', lazy.layout.move_up(), desc='Move window up'),
    
    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, 'control'], 'Left', lazy.layout.grow_width(-100), desc='Grow window to the left'),
    Key([mod, 'control'], 'Right', lazy.layout.grow_width(100), desc='Grow window to the right'),
    Key([mod, 'control'], 'Down', lazy.layout.grow_height(-100), desc='Grow window down'),
    Key([mod, 'control'], 'Up', lazy.layout.grow_height(100), desc='Grow window up'),
    Key([mod], 'n', lazy.layout.reset_size(), desc='Reset all window sizes'),
    
    Key([mod, 'shift', 'control'], 'Left', lazy.layout.integrate_left(), desc='Integrate window to the left'),
    Key([mod, 'shift', 'control'], 'Right', lazy.layout.integrate_right(), desc='Integrate window to the right'),
    Key([mod, 'shift', 'control'], 'Down', lazy.layout.integrate_down(), desc='Integrate window to the down'),
    Key([mod, 'shift', 'control'], 'Up', lazy.layout.integrate_up(), desc='Integrate window to the up'),
    
    Key([mod], 'Return', lazy.spawn(terminal), desc='Launch terminal'),
    
    Key([mod], 'q', lazy.window.kill(), desc='Kill focused window'),
    
    Key([mod], 'f', lazy.window.toggle_fullscreen(), desc='Toggle fullscreen on the focused window'),
    Key([mod], 't', lazy.window.toggle_floating(), desc='Toggle floating on the focused window'),
    
    Key([mod], 'c', lazy.spawn('xcolor -s clipboard'), desc='Color picker'),
    Key([mod], 'e', lazy.spawn('extract-audio'), desc='Extract audio from video'),
    
    Key([], "Print",
        lazy.spawn('escrotum -C'),
        desc='Take fullscreen screenshot and copy to clipboard'
    ),
    Key(['shift'], "Print",
        lazy.spawn('escrotum -s -C'),
        desc='Take selected screenshot and copy to clipboard'
    ),

    Key([alt, 'shift'], 'minus',
        lazy.spawn('xdotool key --clearmodifiers emdash'),
        desc="Type an em dash",
        swallow=False
    ),

    Key([mod, 'control'], 'r', lazy.reload_config(), desc='Reload the config'),
    Key([mod, 'control'], 'i', lazy.spawn('snixembed --fork'), desc='Reload systray icons'),
    Key([mod, 'control'], 'l', lazy.spawn('lockscreen'), desc='Activate lockscreen'),
    Key([mod, 'control'], 'w', lazy.spawn('nitrogen --restore'), desc='Restore walpaper'),
    Key([mod, 'control'], 'q', lazy.shutdown(), desc='Shutdown Qtile'),
    Key([mod, 'control'], 'Escape', lazy.restart(), desc='Restart Qtile'),
    
    Key([mod], 'r', lazy.spawn('launcher'), desc='Open an application using rofi'),
    Key([mod, 'shift'], 'r', lazy.spawn('runner'), desc='Run a command using rofi'),
    # Volume controls
    Key([], 'XF86AudioRaiseVolume', lazy.widget['volume'].increase_vol(), desc='Increase volume'),
    Key([], 'XF86AudioLowerVolume', lazy.widget['volume'].decrease_vol(), desc='Decrease volume'),
    Key([], 'XF86AudioMute', lazy.widget['volume'].mute(), desc='Toggle volume mute'),
]

layout_opts = dict(
    font='JetBrainsMono Nerd Font,sans',
    fontsize=14,
    margin=3,
    border_focus='cba6f7',
    border_focus_fixed='cba6f7',
    border_normal='89b4fa',
    border_normal_fixed='89b4fa',
    border_width=2,
    border_width_single=2
)

layouts = [
    layout.Plasma(**layout_opts),
    layout.Max(**layout_opts)
]

group_opts = [
    { 'name': '1', 'label' : '󰆍', 'spawn': [f'{terminal} --hold nitch', 'codium /home/nlevitt/nixos-config'], 'matches': [Match(wm_class='vscodium')] },
    { 'name': '2', 'label' : '󰙯', 'spawn': discord, 'matches': [Match(wm_class='vesktop')] },
    { 'name': '3', 'label' : '󰈹', 'spawn': browser, 'matches': [Match(wm_class='floorp')], 'layout': 'max', 'layout_opts': layout_opts },
    { 'name': '4', 'label' : '󰓓', 'spawn': 'steam', 'matches': [Match(wm_class='steam')] },
]
group_opts.extend([{ 'name': str(i) } for i in range(len(group_opts) + 1, 10)])

groups = [Group(**opts) for opts in group_opts]

for group in groups:
    keys.extend(
        [
            # mod1 + letter of group = switch to group
            Key([mod],
                group.name,
                lazy.group[group.name].toscreen(),
                desc=f'Switch to group {group.name}',
            ),
            # mod1 + shift + letter of group = switch to & move focused window to group
            Key(
                [mod, 'shift'],
                group.name,
                lazy.window.togroup(group.name, switch_group=True),
                desc=f'Switch to & move focused window to group {group.name}',
            ),
        ]
    )

@dataclass
class ScratchPadEntry:
    name: str
    process: str
    key: str
    size: tuple[int, int] = 0.6, 0.7

    @property
    def width(self):
        return self.size[0]
    
    @property
    def height(self):
        return self.size[1]

large = (0.8, 0.9)
small = (0.4, 0.55)

scratchpad_opts = [
    ('term', terminal, 'Return'),
    ('btop', f'{terminal} btop', 'b', large),
    ('gpt', f'{terminal} tgpt -i', 'g'),
    ('diskspace', f'{terminal} diskonaut', 'd', large),
    
    ('calc', 'qalculate-gtk', 'c', small),
    ('files', files, 'f'),
    
    ('anime', f'{terminal} ani-cli', 'a', small),
    ('youtube', f'{terminal} ytfzf', 'y', small)
]

scratchpad_entries = [ScratchPadEntry(*opts) for opts in scratchpad_opts]

scratchpad = ScratchPad('scratchpad',
    [
        DropDown(entry.name, entry.process, on_focus_lost_hide=False, 
            x=0.5 - entry.width/2,
            y=0.5 - entry.height/2,
            width=entry.width,
            height=entry.height
        ) for entry in scratchpad_entries
    ]
)

groups.insert(0, scratchpad)
keys.extend(
    [
        Key([mod, 'shift'], entry.key,
            lazy.group['scratchpad'].dropdown_toggle(entry.name),
            desc=f'Toggle scratchpad {entry.name}'
        ) for entry in scratchpad_entries
    ]
)

keys.append(
    Key([mod], 'Escape',
        lazy.group['scratchpad'].hide_all(),
        desc='Close scratchpad'
    )
)

@lazy.window.function
def to_prev_group(window):
    to_group_name = window.group.get_previous_group().name
    window.togroup(to_group_name, switch_group=True)


@lazy.window.function
def to_next_group(window):
    to_group_name = window.group.get_next_group().name
    window.togroup(to_group_name, switch_group=True)

keys.extend(
    [
        Key(
            [mod, alt], 'Left', lazy.screen.prev_group(),
            desc='Move to the next group to the left'
        ),
        Key(
            [mod, alt], 'Right', lazy.screen.next_group(),
            desc='Move to the next group to the right'
        ),
        Key(
            [mod, alt, 'shift'], 'Left', to_prev_group(),
            desc='Switch to & move focused window to the next group to the left'
        ),
        Key(
            [mod, alt, 'shift'], 'Right', to_next_group(),
            desc='Switch to & move focused window to the next group to the right'
        )
    ]
)

widget_defaults = dict(
    font='JetBrainsMono Nerd Font,sans',
    fontsize=14,
    foreground='f5f5f5',
    padding=7,
)
extension_defaults = widget_defaults.copy()

default_decoration_options = dict(
    colour="151525",
    line_colour="89b4fa",
    line_width=1.5,
    radius=10,
    filled=True,
    group=True
)

default_decorations = {
    "decorations": [
        decorations.RectDecoration(
            **default_decoration_options
        )
    ]
}

text_decorations = {
    "decorations": [
        decorations.RectDecoration(
            extrawidth=7,
            **default_decoration_options
        )
    ]
}

systray_decorations = {
    "decorations": [
        decorations.RectDecoration(
            extrawidth=7,
            use_widget_background=True,
            **default_decoration_options
        )
    ]
}

exit_decorations = {
    "decorations": [
        decorations.RectDecoration(
            extrawidth=4,
            **default_decoration_options
        )
    ]
}

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.TextBox(
                    '',
                    fontsize=18,
                    foreground='89b4fa',
                    mouse_callbacks={
                        'Button1': lazy.spawn('launcher'),
                        'Button2': lazy.spawn('nitrogen'),
                        'Button3': lazy.spawn('nitrogen --random --set-auto'),
                    },
                    **text_decorations
                ),
                widget.Spacer(length=8),
                widget.GroupBox(
                    highlight_method='text',
                    active='89b4fa',
                    this_current_screen_border='cba6f7',
                    hide_unused=True,
                    padding=7,
                    **exit_decorations
                ),
                widget.Spacer(length=8),
                widget.TaskList(
                    fontsize=10,
                    border='89b4fa',
                    borderwidth=1,
                    padding=5,
                    **default_decorations
                ),
                widget.Spacer(length=8),
                widget.Systray(
                    background="00000000",
                    **systray_decorations
                ),
                widget.Spacer(length=8),
                widget.CPU(
                    format=' {load_percent}%',
                    foreground='fcae98',
                    mouse_callbacks={
                        'Button1': lazy.group['scratchpad'].dropdown_toggle('btop')
                    },
                    **default_decorations
                ),
                widget.Memory(
                    format=' {MemUsed:.1f} {mm}B',
                    foreground='f9e2af',
                    measure_mem='G',
                    mouse_callbacks={
                        'Button1': lazy.group['scratchpad'].dropdown_toggle('btop')
                    },
                    **default_decorations
                ),
                widget.DF(
                    format='󱛟 {r:.0f}%',
                    foreground='a6e3a1',
                    visible_on_warn=False,
                    mouse_callbacks={
                        'Button1': lazy.group['scratchpad'].dropdown_toggle('btop')
                    },
                    **default_decorations
                ),
                widget.Spacer(length=8),
                widget.Volume(
                    fmt='󰕾 {}',
                    mute_format='Muted',
                    foreground='94e2d5',
                    mouse_callbacks={
                        'Button1': lazy.widget['volume'].mute(),
                        'Button2': lazy.spawn('noisetorch'),
                        'Button3': lazy.spawn('pavucontrol')
                    },
                    **default_decorations
                ),
                widget.Spacer(length=8),
                widget.Wlan(
                    format='󰖩 {essid}',
                    foreground='89b4fa',
                    interface='wlp5s0',
                    **default_decorations
                ),
                widget.Spacer(length=8),
                widget.Clock(
                    format='󰃰 %a %m-%d-%Y %I:%M %p',
                    foreground='ceaff5',
                    **default_decorations
                ),
                widget.Spacer(length=8),
                widget.TextBox(
                    '⏻',
                    fontsize=18,
                    foreground='ff6b88',
                    mouse_callbacks={
                        'Button1': lazy.spawn('powermenu'),
                    },
                    **exit_decorations
                )
            ],
            size=30,
            background='00000000',
            border_color='00000000',
            opacity=0.95,
            border_width=2,
            margin=3
        )
    )
]

# Drag floating layouts
mouse = [
    Drag([mod], 'Button1', lazy.window.set_position(), start=lazy.window.get_position()),
    Drag([mod], 'Button3', lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], 'Button2', lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []
follow_mouse_focus = True
bring_front_click = 'floating_only'
floats_kept_above = True
cursor_warp = False
floating_layout = layout.Floating(
    border_focus='cba6f7',
    border_normal='89b4fa',
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class='confirmreset'),  # gitk
        Match(wm_class='makebranch'),  # gitk
        Match(wm_class='maketag'),  # gitk
        Match(wm_class='ssh-askpass'),  # ssh-askpass
        Match(wm_class='qalculate-gtk'), # calculator
        Match(wm_class='zenity'), # selector
        Match(title='branchdialog'),  # gitk
        Match(title='pinentry'),  # GPG key password entry
        Match(title='float_kitty'),
    ]
)
auto_fullscreen = True
focus_on_window_activation = 'focus'
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = False

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = 'LG3D'