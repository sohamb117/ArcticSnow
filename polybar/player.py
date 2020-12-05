#!/usr/bin/python

import gi
gi.require_version('Playerctl', '2.0')
from gi.repository import Playerctl, GLib
manager = Playerctl.PlayerManager()

title = "Nothing's playing."
splitList = ['(',',','[',';','\n', 'feat.', 'ft.']

def trimmer(name):
    for idx in splitList:
        if idx in name:
            name = name.split(idx)[0].strip()
    return(name)

def get_value(name):
    global title
    player = Playerctl.Player.new_from_name(name)
    status = player.props.status
    try:
        title = '\"' + trimmer(player.get_title()) + '\" by ' + trimmer(player.get_artist())
        if len(title) > 47:
            title = title[0:47]+"..."
    except:
        title = "Nothing's playing."
    if "No player could handle this command" in title:
        title = "Nothing's playing."

for name in manager.props.player_names:
    if "playerctld" in name.name:
        get_value(name)

print(title)

#for name in manager.props.player_names:
#    player = Playerctl.Player.new_from_name(name)
#    status = player.props.status
#    if status == "Playing":
#        activePlayer = name

#def next():
#    player = Playerctl.Player.new_from_name(activePlayer)
#    player.play()
#    player.next()

#def prev():
#    player = Playerctl.Player.new_from_name(activePlayer)
#    if player.get_position() < 10000000:
#        player.previous()
#    else:
#        player.set_position(0)
#    player.play()
