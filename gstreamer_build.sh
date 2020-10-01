#!/usr/bin/bash

# bail on script if we get a non zero retcode
set -e
# use multicores
export MAKEFLAGS="-j 6"
# use latest gstreamer stable build
export BRANCH="1.18"
# setup env
export LIBRARY_PATH=/usr/lib:/opt/vc/lib
export LD_LIBRARY_PATH=/usr/lib:/opt/vc/lib
export C_INCLUDE_PATH=/usr/include:/opt/vc/include
export CPATH=/usr/include:/opt/vc/include:opt/vc/include/interface/vcos/pthreads:/opt/vc/include/interface/vmcs_host/linux
export PKG_CONFIG_PATH=/usr/lib/pkgconfig/:/usr/share/pkgconfig/:/opt/gst-build/subprojects/gst-editing-services/pkgconfig/:/opt/gst-build/builddir/subprojects/gst-editing-services/pkgconfig/
export ACLOCAL_PATH=/usr/share/aclocal
export ACLOCAL="aclocal -I $ACLOCAL_PATH"
export PATH=/usr:/usr/include:/usr/lib:/usr/bin:$PATH
export LDFLAGS='-L/usr/lib -L/opt/vc/lib' \
CFLAGS='-I/usr/include -I/opt/vc/include -I/opt/vc/include/interface/vcos/pthreads -I/opt/vc/include/interface/vmcs_host/linux' \
CPPFLAGS='-I/usr/include -I/opt/vc/include -I/opt/vc/include/interface/vcos/pthreads -I/opt/vc/include/interface/vmcs_host/linux -I/usr/include/python3.7m'

# hold some pkgs
apt-cache dumpavail | dpkg --merge-avail
echo "libegl-dev hold" | dpkg --set-selections
echo "libegl-mesa0  hold" | dpkg --set-selections
echo "libegl1 hold" | dpkg --set-selections
echo "libegl1-mesa hold" | dpkg --set-selections
echo "libegl1-mesa-dev hold" | dpkg --set-selections
echo "libgles-dev hold" | dpkg --set-selections
echo "libgles2 hold" | dpkg --set-selections
echo "libgles2-mesa-dev hold" | dpkg --set-selections
# echo "libgstreamer1.0-0 hold" | dpkg --set-selections
# echo "libgstreamer-plugins-base1.0-0 hold" | sude dpkg --set-setlections

# install base reqs + add’l packages
apt-get update
apt-get install --no-install-recommends -y \
screen build-essential autotools-dev automake autoconf checkinstall \
tar pkg-config bison flex git gtk-doc-tools raspberrypi-kernel-headers \
tmux v4l-conf locate net-tools udisks2 ripgrep vim xserver-xorg xinit xmlto x11-xserver-utils \
python3 python-gi-dev yasm python3-dev python-dev python3-venv python3-pip python-gst-1.0 \
python-gobject python-gobject-2 python-gobject-2-dev python-gi-dev gir1.2-gtk-3.0 \
libgirepository1.0-dev libtool cmake autopoint libxml2-dev zlib1g-dev libglib2.0-0 libglib2.0-dev  \
libasound2-dev libgsystem-dev libgudev-1.0-dev libxt-dev libvorbis-dev libcdparanoia-dev \
libpango1.0-dev libtheora-dev libvisual-0.4-dev iso-codes \
libgtk-3-dev libraw1394-dev libiec61883-dev libavc1394-dev tclsh \
libv4l-dev libcairo2-dev libcaca-dev libspeex-dev libpng-dev \
libshout3-dev libjpeg-dev libaa1-dev libflac-dev libdv4-dev \
libtag1-dev libwavpack-dev libpulse-dev libsoup2.4-dev libbz2-dev \
libcdaudio-dev libdc1394-22-dev ladspa-sdk libass-dev \
libcommoncpp2-dev libfuntools-dev libcurl4-gnutls-dev libdca-dev \
libexempi-dev libexif-dev libfaad-dev libgme-dev libgsm1-dev \
libiptcdata0-dev libkate-dev libmimic-dev libmms-dev \
libmodplug-dev libmpcdec-dev libofa0-dev libopus-dev \
librsvg2-dev librtmp-dev libschroedinger-dev libslv2-dev libx11-dev libx11-xcb-dev \
libsndfile1-dev libsoundtouch-dev libspandsp-dev \
libxvidcore-dev libzbar-dev libzvbi-dev liba52-0.7.4-dev \
libcdio-dev libcdio-cdda2 libcdio-paranoia2 libdvdread-dev libmad0-dev libmp3lame-dev \
libmpeg2-4-dev libopencore-amrnb-dev libopencore-amrwb-dev libssl-dev \
libsidplay1-dev libtwolame-dev libx264-dev libx265-dev libusb-1.0 wayland-protocols \
vulkan-validationlayers-dev libaacs0 libaom0 libass9 libasyncns0 \
libbdplus0 libbluray2 libbs2b0 libcdio18 libchromaprint1 libcodec2-0.8.1 libcroco3 libdatrie1 \
pulseaudio libdrm-common libdrm-nouveau2 libdrm2 libfftw3-double3 libflac8 libflite1 \
libfontconfig1 libgdk-pixbuf2.0-0 libgdk-pixbuf2.0-common libgl1 \
libsndio7.0 libsoxr0 libswresample3 libswscale5 snd-gtk-pulse \
libthai-data libthai0 libtiff5 libtwolame0 libva-drm2 libva2 libva-glx2 \
libvorbisenc2 libvpx5 libwavpack1 \
libwebp6 libwebpmux3 libxcb-dri3-0 libxcb-glx0 libxcb-present0 libxcb-render0 libxcb-shape0 \
libxcb-shm0 libxcb-sync1 libxtst6 libxv1 libxvidcore4 \
sndiod sordi speex libportaudio2 alsa-base alsa-utils alsa-tools \
doxygen apt-file gcc-8-source libunwind-dev libunwind8 libdw-dev \
libgphobos-8-dev gettext libpthread-workqueue-dev libpthread-workqueue0 libpthread-stubs0-dev \
libixp-dev libgc-dev gsl-bin libavcodec-dev libavdevice-dev libavdevice58 libavfilter-dev \
libavutil-dev libavresample-dev libavformat-dev libcap-dev libwebrtc-audio-processing-dev \
libsrtp0-dev libsrtp2-dev gbutils libgbm-dev python-opengl \
python3-opengl wx3.0-headers libvorbisidec-dev libmpg123-dev python3-bluez bluez-dbgsym \
libkf5bluezqt6 libcapi20-3 libgd3 libgettextpo0 libvkd3d1 libodbc1 \
libfluidsynth-dev flite1-dev makedev libval-dev lush-library \
libssh2-1-dev libsrecord-dev libbs2b-dev libdirectfb-dev libc6-dbg llvm-9-dbgsym \
libmjpegtools-dev mjpegtools-gtk libopenal-dev libopenmpt-dev libvo-aacenc-dev \
libvo-amrwbenc-dev libwildmidi-dev libvdpau-dev libavutil-dev \
libbluray-dev libshine-dev libvpx-dev spirv-headers libcgroup-dev \
xpra liblilv-dev libjack-jackd2-dev libxvmc-dev libgsl-dev dh-make po-debconf \
libgtkmm-3.0-dev dh-autoreconf dh-strip-nondeterminism intltool-debian \
libarchive-cpio-perl libarchive-zip-perl libfile-stripnondeterminism-perl \
libglibmm-2.4-dev libsigc++-2.0-dev libxml++2.6-dev libsys-hostname-long-perl audiotools \
libcdio-cdda-dev libncbi6-dev libgraphene-1.0-dev libsdl2-2.0-0 libxss1 \
rtkit libklibc-dev python3-pycparser libchromaprint-dev libchromaprint-tools \
musl-dev libgdbm-dev libmd0 libsbuf6 byacc libxkbcommon-x11-dev liblief-dev libdnet-dev libffcall-dev \
aom-tools libaom-dev glslang-dev glslang-tools libopencv-dev libopencv-core-dev libdlib-dev \
libcsfml-audio2.5 libcsfml-dev libsfml-audio2.5 libsfml-dev libboost1.67-dev libocct-foundation-dev \
libgupnp-1.0-dev libgupnp-av-1.0-dev libgupnp-igd-1.0-dev libogre-1.8-dev \
libdssialsacompat-dev libcmocka-dev liblrdf0-dev libde265-dev libenca0 libcork-dev \
libassimp-dev libcamel1.2-dev libgmerlin-dev python3-cairo-dev libneon27-dev

# remove brcm lib conflicts
apt-get remove -y libgles2 libgles2-mesa-dev libegl-dev libegl1-mesa libegl1-mesa-dev libgles-dev

# pip install tools, libs
pip3 install meson
pip3 install ninja
pip3 install pycairo
# pip3 install PyGObject

echo && echo
echo "### fetching wayland src ###"
# install wayland libs
cd /opt
git clone https://gitlab.freedesktop.org/wayland/wayland.git
cd wayland
./autogen.sh --prefix=/usr --disable-documentation
make
make install
mkdir -p /usr/share/aclocal

echo && echo
echo "### fetching srt src ###"
# install srt libs
cd /opt
git clone https://github.com/Haivision/srt
cd srt
./configure --cmake-install-prefix=/usr
make
make install

echo && echo
echo "### fetching ffmpeg src ###"
# install ffmpeg src (faster than using gst-build)
# libs for gst-libav
cd /opt
git clone https://git.ffmpeg.org/ffmpeg.git ffmpeg
ln -s /opt/ffmpeg/lib* /usr/include/
ln -s /opt/ffmpeg/lib* /usr/lib
cd ..

echo && echo
echo "### linking libs ###"
# library and headers #
# recreate classic libs, now brcm*
ln -s /opt/vc/lib/* /usr/lib/
ln -s /opt/vc/lib/libbrcmGLESv2.so /usr/lib/libGLESv2.so
ln -s /opt/vc/lib/libbrcmEGL.so /usr/lib/libEGL.so
# & pkgconfig files
ln -s /opt/vc/lib/pkgconfig/* /usr/lib/pkgconfig/
ln -s /opt/vc/lib/pkgconfig/brcmglesv2.pc /usr/lib/pkgconfig/glesv2.pc
ln -s /opt/vc/lib/pkgconfig/brcmegl.pc /usr/lib/pkgconfig/egl.pc
ln -s /opt/vc/lib/pkgconfig/brcmglesv2.pc /opt/vc/lib/pkgconfig/glesv2.pc
ln -s /opt/vc/lib/pkgconfig/brcmegl.pc /opt/vc/lib/pkgconfig/egl.pc
# other libs, pccd gs
ln -s /opt/srt/lib* /usr/lib/
ln -s /opt/srt/*.pc /usr/lib/pkgconfig/
ln -s /opt/srt/srt-* /usr/include/
# symlink headers
ln -s /opt/vc/include/IL/* /usr/include/
ln -s /opt/vc/include/IL/ /usr/include/IL
ln -s /opt/vc/include/EGL/ /usr/include/EGL
ln -s /opt/vc/include/GLES/ /usr/include/GLES
ln -s /opt/vc/include/GLES2/ /usr/include/GLES2
ln -s /opt/vc/include/KHR/ /usr/include/KHR
ln -s /opt/vc/include/VG/ /usr/include/VG
ln -s /opt/vc/include/WF/ /usr/include/WF
ln -s /opt/vc/include/interface/ /usr/include/interface
ln -s /opt/vc/include/vcinclude/ /usr/include/vcinclude
# ldconfig
ldconfig

echo && echo
echo "### fetching gst-build src ###"
# get src
cd /opt
git clone https://gitlab.freedesktop.org/gstreamer/gst-build
cd gst-build
git checkout origin/$BRANCH
# prefetching / or for build modifications (needed for FFMpeg patch)
mkdir /opt/gst-build/subprojects/withheld
mv /opt/gst-build/subprojects/gst-editing-services.wrap /opt/gst-build/subprojects/withheld
mv /opt/gst-build/subprojects/FFmpeg.wrap /opt/gst-build/subprojects/withheld
mv /opt/gst-build/subprojects/openh264.wrap /opt/gst-build/subprojects/withheld
mv /opt/gst-build/subprojects/gst-plugins-rs.wrap /opt/gst-build/subprojects/withheld
mv /opt/gst-build/subprojects/gstreamer-vaapi.wrap /opt/gst-build/subprojects/withheld

echo && echo
echo "### fetching *subproject src ###"
meson subprojects download
# meson subprojects update
cd subprojects
git clone https://github.com/tinyalsa/tinyalsa.git

# *installed build
echo && echo
echo "### meson ###"
cd /opt/gst-build
meson --prefix="/usr" --includedir="/usr/include" --libdir="/usr/lib" --pkg-config-path="/usr/lib/pkgconfig" \
-D gst-examples=enabled \
-D omx=enabled \
-D gst-omx:target=rpi \
-D gst-omx:header_path=/opt/vc/include/IL/ \
-D python=enabled \
-D rtsp_server=enabled \
-D gst-plugins-base:gl_api=gles2 \
-D gst-plugins-base:gl_platform=egl \
-D gst-plugins-base:gl_winsys=dispmanx \
-D gst-plugins-base:gles2_module_name=/usr/lib/libbrcmGLESv2.so \
-D gst-plugins-base:egl_module_name=/usr/lib/libbrcmEGL.so \
-D introspection=enabled \
-D openh264:*=disabled \
-D ffmpeg:*=disabled \
-D gst-plugins-rs:*=disabled \
-D gst-editing-services:*=disabled \
-D gstreamer-vaapi:*=disabled \
-D tinyalsa:*=enabled \
builddir

echo && echo
echo "### ninja build ###"
ninja -C builddir
echo && echo
echo "### meson install ###"
meson install -C builddir
echo 'include /usr/lib' | tee -a /etc/ld.so.conf.d/usrlocal.conf
echo 'include /usr/lib/arm-linux-gnueabihf' | tee -a /etc/ld.so.conf.d/usrlocal.conf
ldconfig

echo && echo
echo "END"
exit
