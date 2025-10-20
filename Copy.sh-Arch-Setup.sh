cd ~
to_remove=(
  "hello.rs" "hello.c" "hello.asm" "hello.pl" "hello.ml"
  "hello.py" "hello.js" "startx.sh" "v86-in-v86.js"
)
for file in "${to_remove[@]}"; do
  if [[ -f $file ]]; then
    echo "Deleting $file ..."
    rm "$file"
  fi
done
./networking.sh
rm networking.sh
sudo pacman -Sy --noconfirm
sudo pacman -S --noconfirm yay base-devel
if [[ ! -d paru ]]; then
  git clone https://aur.archlinux.org/paru.git
  cd paru
  makepkg -si --noconfirm
else
  echo "paru directory already exists. Skipping clone."
fi]
