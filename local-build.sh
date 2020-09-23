APP_NAME="com.opera.Opera"
APP_SRC="${APP_NAME}.yaml"
APP_PKG="${APP_NAME}.flatpak"

rm "${APP_PKG}"
rm -rf build; mkdir build
rm -rf repo; mkdir repo

# Build repo
flatpak-builder ${GPG_SETTINGS:-} --verbose --force-clean --ccache  --repo=repo  build ${APP_SRC}

# Build .flatpak file
flatpak build-bundle ${GPG_BUNDLE_SETTINGS} repo ${APP_PKG} ${APP_NAME}
