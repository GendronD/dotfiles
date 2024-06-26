#!/bin/bash

SPOTIFY_EVENT="com.spotify.client.PlaybackStateChanged"
POPUP_SCRIPT="sketchybar -m --set spotify.anchor popup.drawing=toggle"

spotify_anchor=(
  script="$PLUGIN_DIR/spotify.sh"
  click_script="$POPUP_SCRIPT"
  popup.horizontal=on
  popup.align=center
  popup.height=150
  popup.y_offset=3
  icon=􁁒
  label.drawing=off
  drawing=off
)

spotify_cover=(
  script="$PLUGIN_DIR/spotify.sh"
  click_script="open -a 'Spotify'; $POPUP_SCRIPT"
  label.drawing=off
  icon.drawing=off
  padding_left=12
  padding_right=10
  background.image.scale=0.2
  background.image.drawing=on
  background.drawing=on
)

spotify_title=(
  icon.drawing=off
  padding_left=0
  padding_right=0
  width=0
  label.font="SF Pro:Semibold:15.0"
  y_offset=55
)

spotify_artist=(
  icon.drawing=off
  y_offset=30
  padding_left=0
  padding_right=0
  width=0
  label.font="SF Pro:Semibold Light:13.0"
)

spotify_album=(
  icon.drawing=off
  padding_left=0
  padding_right=0
  y_offset=15
  width=0
  label.font="SF Pro:Semibold Light: 13.0"
)

spotify_state=(
  icon.drawing=on
  icon.font="SF Pro:Light:10.0"
  icon.width=35
  icon.padding_left=4
  icon.padding_right=4
  icon="00:00"
  label.drawing=on
  label.font="SF Pro:Light:10.0"
  label.width=35
  label.padding_right=4
  label.padding_left=4
  label="00:00"
  padding_left=0
  padding_right=0
  y_offset=-15
  width=0
  background.color=$TRANSPARENT
  slider.background.height=6
  slider.background.corner_radius=4
  slider.background.color=$ACCENT_COLOR
  slider.highlight_color=$GREEN
  slider.percentage=40
  slider.width=130
  script="$PLUGIN_DIR/spotify.sh"
  update_freq=1
  updates=when_shown
)

spotify_shuffle=(
  icon=􀊝
  icon.padding_left=5
  icon.padding_right=5
  icon.color=$ICON_COLOR
  icon.highlight_color=$PRIMARY
  label.drawing=off
  script="$PLUGIN_DIR/spotify.sh"
  y_offset=-45
)

spotify_back=(
  icon=􀊎
  icon.padding_left=5
  icon.padding_right=5
  icon.color=$ICON_COLOR
  script="$PLUGIN_DIR/spotify.sh"
  label.drawing=off
  y_offset=-45
)

spotify_play=(
  icon=􀊔
  background.height=40
  background.corner_radius=20
  width=40
  align=center
  background.color=$ITEM_BG_COLOR
  background.border_color=$WHITE
  background.border_width=0
  background.drawing=on
  icon.padding_left=4
  icon.padding_right=5
  icon.color=$WHITE
  updates=on
  label.drawing=off
  script="$PLUGIN_DIR/spotify.sh"
  y_offset=-45
)

spotify_next=(
  icon=􀊐
  icon.padding_left=5
  icon.padding_right=5
  icon.color=$ICON_COLOR
  label.drawing=off
  script="$PLUGIN_DIR/spotify.sh"
  y_offset=-45
)

spotify_repeat=(
  icon=􀊞
  icon.highlight_color=$PRIMARY
  icon.padding_left=5
  icon.padding_right=10
  icon.color=$ICON_COLOR
  label.drawing=off
  script="$PLUGIN_DIR/spotify.sh"
  y_offset=-45
)

spotify_controls=(
  background.color=$TRANSPARENT
  background.corner_radius=11
  background.drawing=on
  y_offset=-45
)

spotify_spacer=(
  background.color=$TRANSPARENT
  width=2
)

sketchybar --add event spotify_change $SPOTIFY_EVENT             \
           --add item spotify.anchor center                      \
           --set spotify.anchor "${spotify_anchor[@]}"           \
           --subscribe spotify.anchor mouse.entered mouse.exited \
                                      mouse.exited.global        \
                                                                 \
           --add item spotify.cover popup.spotify.anchor         \
           --set spotify.cover "${spotify_cover[@]}"             \
                                                                 \
           --add item spotify.title popup.spotify.anchor         \
           --set spotify.title "${spotify_title[@]}"             \
                                                                 \
           --add item spotify.artist popup.spotify.anchor        \
           --set spotify.artist "${spotify_artist[@]}"           \
                                                                 \
           --add item spotify.album popup.spotify.anchor         \
           --set spotify.album "${spotify_album[@]}"             \
                                                                 \
           --add slider spotify.state popup.spotify.anchor       \
           --set spotify.state "${spotify_state[@]}"             \
           --subscribe spotify.state mouse.clicked               \
                                                                 \
           --add item spotify.shuffle popup.spotify.anchor       \
           --set spotify.shuffle "${spotify_shuffle[@]}"         \
           --subscribe spotify.shuffle mouse.clicked             \
                                                                 \
           --add item spotify.back popup.spotify.anchor          \
           --set spotify.back "${spotify_back[@]}"               \
           --subscribe spotify.back mouse.clicked                \
                                                                 \
           --add item spotify.play popup.spotify.anchor          \
           --set spotify.play "${spotify_play[@]}"               \
           --subscribe spotify.play mouse.clicked spotify_change \
                                                                 \
           --add item spotify.next popup.spotify.anchor          \
           --set spotify.next "${spotify_next[@]}"               \
           --subscribe spotify.next mouse.clicked                \
                                                                 \
           --add item spotify.repeat popup.spotify.anchor        \
           --set spotify.repeat "${spotify_repeat[@]}"           \
           --subscribe spotify.repeat  mouse.clicked             \
                                                                 \
           --add item spotify.spacer popup.spotify.anchor        \
           --set spotify.spacer "${spotify_spacer[@]}"           \
                                                                 \
           --add bracket spotify.controls spotify.shuffle        \
                                          spotify.back           \
                                          spotify.play           \
                                          spotify.next           \
                                          spotify.repeat         \
           --set spotify.controls "${spotify_controls[@]}"       \
