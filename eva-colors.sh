#!/usr/bin/bash

# Update default profile for the GNOME Terminal.

PROFILE=$(gsettings get org.gnome.Terminal.ProfilesList default | tr -d \')
BASE="org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$PROFILE/"

echo "Updating GNOME Terminal profile: $PROFILE"

gsettings set "$BASE" use-theme-colors false

gsettings set "$BASE" background-color '#000000'
gsettings set "$BASE" foreground-color '#FF7A00'
gsettings set "$BASE" bold-color '#FF7A00'
gsettings set "$BASE" use-transparent-background false
gsettings set "$BASE" use-system-font false
gsettings set "$BASE" font 'JetBrains Mono 12'
gsettings set "$BASE" palette "[
'#000000',
'#FF5A00',
'#00FF00',
'#FF7A00',
'#222222',
'#FF5A00',
'#00FF00',
'#FF7A00',
'#000000',
'#FF5A00',
'#00FF00',
'#FF7A00',
'#222222',
'#FF5A00',
'#00FF00',
'#FFFFFF'
]"

echo "Updating GNOME Terminal profile: done."

cat <<'EOF' >> ~/.bashrc

# >>> EVA_PS1_BEGIN >>>
__eva_git_branch() {
  local b
  b=$(git rev-parse --abbrev-ref HEAD 2>/dev/null) || return 0
  [[ "$b" == "HEAD" ]] && b=$(git rev-parse --short HEAD 2>/dev/null) || true
  [[ -n "$b" ]] && printf " (%s)" "$b"
}
BOLD='\[\e[1m\]'
NEON_RED='\[\e[1;38;5;196m\]'
GREEN='\[\e[1;38;5;46m\]'
RESET='\[\e[0m\]'
PROMPT_COMMAND='PS1="${GREEN}${BOLD}\u@\h ${NEON_RED}\w\$(__eva_git_branch)${BOLD} \$${RESET} "'
# <<< EVA_PS1_END <<<
EOF

echo "PS1 installed at ~/.bashrc (run: source ~/.bashrc)"
