# TheWayToYCM

This is a note for write my road that how to install the vim8.2 and YouCompleteme successful finally.believe me,it's very hard


# 1.首先,安装依赖项如下：

需要注意的是在Ubuntu16.04中Lua应该为liblua5.1-dev，而在其它版本中应为lua5.1-dev

sudo apt-get install libncurses5-dev libgnome2-dev libgnomeui-dev \
    libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
    libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev \
    python3-dev ruby-dev liblua5.1 lua5.1-dev libperl-dev git


# 2.从github下载vim:

新建一个文件夹存放clone下来的vim，然后在该文件夹下打开终端执行命令：

git clone https://github.com/vim/vim.git

或者你可以自己前往 https://github.com/vim/vim.git 下载压缩包，下载完成后解压便可。

# 3.查询系统中是否已经含有vim，如果有的话删除系统中vim：

dpkg -l | grep vim

sudo apt-get remove vim-xxxx vim-xxxx ...

# 4. 进入下载的VIM目录，执行下面的操作：

1.首先清除项目，避免之前的错误的配置编译后产生的莫名其妙的影响，执行下列两条命令：

make clean
make distclean

2.然后配置正确的编译选项。（注意，有的文章中这里同时配置了python2和python3,此时只有python2生效，如果想让vim8支持python3，则只需要配置python3即可，不要配置python2。（本人配置同时配置了python2和python3，未见错误。））

./configure --with-features=huge \
--enable-multibyte \
--enable-rubyinterp=yes \
--enable-pythoninterp=yes \
--with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu \
--enable-python3interp=yes \
--with-python3-config-dir=/usr/lib/python3.5/config-3.5m-x86_64-linux-gnu \
--enable-perlinterp=yes \
--enable-luainterp=yes \
--enable-gui=gtk2 --enable-cscope --prefix=/usr

# 5. 执行make操作

1.编译，顺便指定安装目录

make VIMRUNTIMEDIR=/usr/share/vim/vim82

2.编译完成后安装

sudo make install

# 6. 查看结果

执行完上面的操作后，就已经成功安装了vim8.2，执行下面的命令可以查看一下安装的结果：

vim --version

值得一提的是，本人装的vim8.2有不明原因的bug，在使用vim-plug或者NERDTree的时候，仅光标附近会出现乱码，移开光标后恢复正常，经过排查后无果，但是机缘巧合下重新安装的vim-gtk使得vim的旧版本，vim7.4重新回到电脑，vi --version可查到是7.4版本，使用vi xx进入编辑的话，不会有上述bug，且能使用所有已经安装在vim8.2上的插件，因此，本人在想，第三步可能没必要，但没试过。

另外就是第4,5步的操作，本人已经写好shell脚本（vim8.2-setup.sh），可复制到下载解压后的vim目录下直接执行，一次性完成所有操作。

# 7.安装vim-plug：

1.download the vim-plug.

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    
2.Add a vim-plug section to your ~/.vim/vimrc,like Example.

call plug#begin('~/.vim/plugged')

Plug 'junegunn/vim-easy-align'        “put the plug you want to install to the ‘ ’

call plug#end()

3.save the .vimrc,and reload it,and input :PlugInstall,waiting the plug installed.

# 8.安装YouCompleteMe：

1.Install cmake, vim and python





















