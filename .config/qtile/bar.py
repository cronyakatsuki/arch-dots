from libqtile.config import Screen
from libqtile.bar import Bar

from libqtile import widget
from libqtile.widget.groupbox import GroupBox
from libqtile.widget.groupbox import GroupBox
from libqtile.widget.currentlayout import CurrentLayout
from libqtile.widget.window_count import WindowCount
from libqtile.widget.windowname import WindowName
from libqtile.widget.wlan import Wlan
from libqtile.widget.battery import Battery
from libqtile.widget.clock import Clock
from libqtile.widget.systray import Systray
from libqtile.widget.spacer import Spacer
from libqtile.widget.df import DF

from colors import catppuccino as colors
from unicodes import lower_left_triangle

from os.path import expanduser

widget_defaults = dict(
    font='JetBrainsMono Nerd Font',
    fontsize=15,
    padding=2,
    foreground=colors['fg1'],
    background=colors['bg1']
)

extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        top=Bar(
            [
                GroupBox(
                    font="IPAGothic",
                    fontsize=15,
                    borderwidth=0,
                    active=colors['yl'],
                    inactive=colors['fg1'],
                    disable_drag=True,
                    block_highlight_text_color=colors['bl1'],
                    highlight_color=colors['bg1'],
                    highlight_method="line",
                    use_mouse_wheel=False,
                    padding=8
                ),
                Spacer(
                    length=2,
                ),
                CurrentLayout(
                    foreground=colors['bl1'],
                    padding=0,
                ),
                Spacer(
                    length=5,
                ),
                WindowCount(
                    show_zero=True,
                    foreground=colors['yl'],
                    padding=0,
                ),
                lower_left_triangle(colors['bg1'], colors['bg3']),
                WindowName(
                    background=colors['bg3'],
                    foreground=colors['mg2'],
                ),
                lower_left_triangle(colors['bg3'], colors['bg1']),
                Spacer(
                    length=8,
                ),
                widget.ThermalSensor(
                    tag_sensor="Tctl",
                    fmt="[ {}]",
                    update_interval=10,
                    foreground=colors['rd'],
                    threshold=75,
                ),
                DF(
                    partition='/',
                    format='[ {uf}{m}/{s}{m}]',
                    visible_on_warn=False,
                    update=43200,
                    foreground=colors['yl'],
                    # padding=0,
                ),
                Wlan(
                    interface="wlp4s0",
                    format='[直 {percent:2.0%}]',
                    disconnected_message='睊',
                    update_interval=5,
                    foreground=colors['gr1'],
                ),
                Battery(
                    show_short_text=False,
                    format='[{char}{percent:2.0%}]',
                    full_char=' ',
                    charge_char=' ',
                    discharge_char=' ',
                    update_interval=10,
                    foreground=colors['bl1'],
                ),
                Spacer(
                    length=2
                ),
                Clock(
                    format="[ %d.%m %H:%M]",
                    update_interval=25,
                    foreground=colors['bl2'],
                    padding=0,
                ),
                lower_left_triangle(colors['bg1'], colors['bg2']),
                Systray(
                    background=colors['bg2'],
                    padding=8,
                    icon_size=21
                ),
                Spacer(
                    background=colors['bg2'],
                    length=4
                ),
            ],
            23,
        ),
        wallpaper=expanduser(
            "~/pics/KurzegartDNA.png"),
        wallpaper_mode='fill'
    ),
]
