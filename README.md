# vimfiles
To use:

cd ~/ && clone https://github.com/loganE/vimfiles.git
ln -s ~/vimfiles/ ~/.vim
vim -c "PlugInstall" +qall

This will clone the config folder, create the sim link for the OS vim config folder, than runs the Plugin Installer to intall all of the plugins. Bear in mind, certain plugins like YouCompleteMe and color_coded must be compiled, like:

cd ~/vimfiles/plugged/YouCompleteMe/
./install.py --clang-complete

cd ~/vimfiles/plugged/color_coded
mkdir build && cd build
cmake ..
make && make install
