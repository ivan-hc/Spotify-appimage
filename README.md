# Spotify-AppImage
Unofficial AppImage for Spotify. This is only an experimental release for test (download [here](https://github.com/ivan-hc/Spotify-AppImage/releases)), created from a popular repository in AUR: use it at your own risk!

If you would like to see an official Spotify AppImage, vote on [community.spotify.com](https://community.spotify.com) and let [SpotifyCares](https://twitter.com/SpotifyCares) know. [A first attempt went and died ](https://community.spotify.com/t5/Closed-Ideas/Provide-Spotify-Desktop-Client-in-cross-distro-AppImage-bundle/idi-p/1337399), but now you can do the difference.

I'm not allowed to distribute Spotify AppImage as an official release, so take this release as an experimental version.

# How to install Spotify with automatic updates on any GNU/Linux disto
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
