# Spotify-AppImage
Unofficial AppImage for Spotify. This is only an experimental release for test (download [here](https://github.com/ivan-hc/Spotify-AppImage/releases)), created from a popular repository in AUR: use it at your own risk!

If you would like to see an official Spotify AppImage, vote on [community.spotify.com](https://community.spotify.com) and let [SpotifyCares](https://twitter.com/SpotifyCares) know. [A first attempt went and died ](https://community.spotify.com/t5/Closed-Ideas/Provide-Spotify-Desktop-Client-in-cross-distro-AppImage-bundle/idi-p/1337399), but now you can do the difference.

I'm not allowed to distribute Spotify AppImage as an official release, so take this release as an experimental version.

If you're looking for furter releases of a standalone version (not an AppImage) that runs anywhere, use [AM](https://github.com/ivan-hc/AM-application-manager), a multiarchitecture Application Manager for AppImages and other standalone programs that works like APT or Pacman, which manages and updates hundreds of programs to the latest version.

# How to convert Spotify to an AppImage
Copy/paste the following script:

    APP=spotify
    mkdir tmp;
    cd ./tmp;
    wget https://github.com/AppImage/AppImageKit/releases/download/continuous/appimagetool-x86_64.AppImage
    mv ./appimagetool-x86_64.AppImage ./appimagetool
    chmod a+x ./appimagetool
    wget -r -A spotify-1:*-x86_64.pkg.tar.zst -nd https://aur.andontie.net/x86_64/;
    tar xf ./*.tar.zst;
    mkdir $APP.AppDir;
    mv ./opt ./$APP.AppDir;
    cp ./$APP.AppDir/opt/spotify/*.desktop ./$APP.AppDir;
    cp ./$APP.AppDir/opt/spotify/icons/spotify-linux-512.png ./$APP.AppDir/spotify-client.png;
    echo '#!/bin/sh
    HERE="$(dirname "$(readlink -f "${0}")")"
    export PATH="${HERE}/opt/spotify/:${HERE}/opt/spotify/Apps/:${HERE}/opt/spotify/icons/:${HERE}/opt/spotify/locales/:${HERE}/opt/spotify/swiftshader/${PATH:+:$PATH}"
    export LD_LIBRARY_PATH="${HERE}/opt/spotify/:${HERE}/opt/spotify/swiftshader/${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"
    export XDG_DATA_DIRS="${HERE}/opt/spotify/${XDG_DATA_DIRS:+:$XDG_DATA_DIRS}"
    export GSETTINGS_SCHEMA_DIR="${HERE}/opt/spotify/swiftshader/${GSETTINGS_SCHEMA_DIR:+:$GSETTINGS_SCHEMA_DIR}"
    EXEC="${HERE}/opt/spotify/spotify"
    exec "${EXEC}"' >> ./$APP.AppDir/AppRun;
    chmod a+x ./$APP.AppDir/AppRun;
    ARCH=x86_64 ./appimagetool -n ./$APP.AppDir
    cd ..
    mv ./tmp/Spotify*AppImage ./

# How to install Spotify with automatic updates on any GNU/Linux disto (not the AppImage)
"[AM](https://github.com/ivan-hc/AM-application-manager)" is a new Application Manager that manages a lot of scripts to install/remove standalone programs and AppImages. The [script to install Spotify](https://raw.githubusercontent.com/ivan-hc/AM-application-manager/main/programs/x86_64/spotify) will install the program in /opt/spotify, a launcher in /usr/share/applications and a link in /usr/local/bin.

#### Installation:

    wget https://raw.githubusercontent.com/ivan-hc/AM-application-manager/main/programs/x86_64/spotify
    chmod a+x ./spotify
    sudo ./spotify
#### Update

    /opt/spotify/AM-updater
#### Uninstall
To remove the AM's version of Spotify, run the following command:

    sudo /opt/spotify/remove

## Find out more at [ivan-hc/AM-application-manager](https://github.com/ivan-hc/AM-application-manager).
