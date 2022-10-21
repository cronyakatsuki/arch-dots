# Basic qtile imports
from libqtile import hook
from libqtile.config import Click, Drag, DropDown, Group, Key, Match, ScratchPad
from libqtile.lazy import lazy

# Layouts importing
from libqtile.layout.floating import Floating
from libqtile.layout.xmonad import MonadTall
from libqtile.layout.stack import Stack

# My customs importing
from colors import catppuccino as colors
from bar import screens, widget_defaults, extension_defaults
from keybindings import terminal, mod, keys

assert(screens)
assert(widget_defaults)
assert(extension_defaults)

groups = [
    Group("1", label="一", matches=[
        Match(wm_class="firefox")],  layout='stack'),

    Group("2", label="二", layout='monadtall'),

    Group("3", label="三", layout='monadtall'),

    Group("4", label="四", matches=[
        Match(wm_class="discord"), Match(wm_class="Ferdium")], layout='stack'),

    Group("5", label="五", matches=[
        Match(wm_class="Spotify")], layout='stack'),

    Group("6", label="六", matches=[
        Match(wm_class="Steam"), Match(
            wm_class="Lutris"), Match(wm_class="heroic"),
        Match(wm_class="itch")], layout='floating'),

    Group("7", label="七", layout='monadtall'),

    Group("8", label="八", layout='monadtall'),

    Group("9", label="九", matches=[
        Match(wm_class="Microsoft Teams - Preview")], layout='stack')]

for i in groups:
    keys.extend(
        [
            # mod1 + letter of group = switch to group
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i.name),
            ),
            # mod1 + shift + letter of group = move focused window to group
            Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
                desc="move focused window to group {}".format(i.name)
                ),
            # mod1 + control + letter of group = switch to & move focused window to group
            Key(
                [mod, "control"],
                i.name,
                lazy.window.togroup(i.name, switch_group=True),
                desc="Switch to & move focused window to group {}".format(
                    i.name),
            ),
        ]
    )

dropdown_theme = {'width': 0.7,
                  'height': 0.8,
                  'x': 0.15,
                  'y': 0.1,
                  'opacity': 1
                  }

groups.append(ScratchPad('scratchpad', [
    DropDown('term', f'{terminal}', **dropdown_theme),
    DropDown('lf', f'{terminal} -e lf', **dropdown_theme),
]))

keys.extend([
    Key([mod], "F1", lazy.group['scratchpad'].dropdown_toggle('term')),
    Key([mod], "F2", lazy.group['scratchpad'].dropdown_toggle('lf')),
])

keys.extend([
    Key([mod, "shift"], "b", lazy.hide_show_bar(), desc="Toggle the bar")
    ])

layout_theme = {"border_width": 3,
                "margin": 15,
                "border_focus": colors['bl1'],
                "border_normal": colors['bg1']
                }

layouts = [
    MonadTall(
        **layout_theme,
        ratio=0.54,
        single_border_width=3
    ),
    Stack(
        **layout_theme,
        num_stacks=1,
    ),
    Floating(
        **layout_theme
    ),
]

floating_layout = Floating(
    **layout_theme,
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
        Match(wm_class="lxappearance"),  # Gtk theme setter
        Match(wm_class="ProtonUp-Qt"),  # Proton/wine manager
    ],
)

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

follow_mouse_focus = False
bring_front_click = False
cursor_warp = False
auto_fullscreen = True
focus_on_window_activation = "focus"
reconfigure_screens = True
auto_minimize = False
wmname = "LG3D"


import os,subprocess
# autostartup once
@hook.subscribe.startup_once
def startup_once():
    home = os.path.expanduser('~/bin/qtile/startup_once')
    subprocess.Popen([home])
