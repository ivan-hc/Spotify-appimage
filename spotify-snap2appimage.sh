#!/bin/sh

APP=spotify

# TEMPORARY DIRECTORY
mkdir -p tmp
cd ./tmp || exit 1

# DOWNLOAD APPIMAGETOOL
if ! test -f ./appimagetool; then
	wget -q https://github.com/AppImage/appimagetool/releases/download/continuous/appimagetool-x86_64.AppImage -O appimagetool
	chmod a+x ./appimagetool
fi

# DOWNLOAD THE SNAP PACKAGE
if ! test -f ./*.snap; then
	wget -q "$(curl -H 'Snap-Device-Series: 16' http://api.snapcraft.io/v2/snaps/info/spotify --silent | sed 's/\[{/\n/g; s/},{/\n/g' | grep -i "stable" | head -1 | sed 's/[()",{} ]/\n/g' | grep "^http")"
fi

# EXTRACT THE SNAP PACKAGE AND CREATE THE APPIMAGE
unsquashfs -f ./*.snap
mkdir -p "$APP".AppDir
VERSION=$(cat ./squashfs-root/meta/*.yaml | grep "^version" | head -1 | cut -c 10-)
mv ./squashfs-root/usr ./"$APP".AppDir/
cp -r ./"$APP".AppDir/usr/share/spotify/icons/*128* ./"$APP".AppDir/"$APP".png
cp -r ./"$APP".AppDir/usr/share/spotify/*.desktop ./"$APP".AppDir/
sed -i "s#Icon=.*#Icon=$APP#g" ./"$APP".AppDir/*.desktop

cat >> ./"$APP".AppDir/AppRun << 'EOF'
#!/bin/sh
HERE="$(dirname "$(readlink -f "${0}")")"
export UNION_PRELOAD="${HERE}"
exec "${HERE}"/usr/bin/spotify "$@"
EOF
chmod a+x ./"$APP".AppDir/AppRun

ARCH=x86_64 ./appimagetool --comp zstd --mksquashfs-opt -Xcompression-level --mksquashfs-opt 20 \
	-u "gh-releases-zsync|$GITHUB_REPOSITORY_OWNER|Spotify-appimage|continuous|*x86_64.AppImage.zsync" \
	./"$APP".AppDir Spotify-"$VERSION"-x86_64.AppImage || exit 1

cd .. && mv ./tmp/*AppImage* ./
