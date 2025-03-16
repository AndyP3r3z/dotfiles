# dnf search vala
# meson build
# dnf search cmake
# sudo dnf install cmake
# meson build
# dnf search gtk | grep 3
# dnf search gtk3-devel
# sudo dnf install gtk3-devel
# meson build
# dnf search gtk-layer-shell
# sudo dnf install gtk-layer-shell gtk-layer-shell-devel
# meson build

sudo dnf install pamixer meson vala cmake gtk3-devel gtk-layer-shell gtk-layer-shell-devel
git clone https://github.com/heyjuvi/avizo
cd avizo
meson build
ninja -C build install
