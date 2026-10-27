#!/bin/sh
# Télécharge les fichiers lourds de la détection des mains (non versionnés) :
#  - le moteur WebAssembly de MediaPipe (paquet npm officiel @mediapipe/tasks-vision)
#  - le modèle Hand Landmarker officiel de Google
# Utilisé par le déploiement GitHub Pages. En local, la page se rabat sur les
# serveurs officiels si ces fichiers sont absents.
set -eu
VERSION=1.1.0
DEST="$(dirname "$0")/../public/vendor/mediapipe"
MODEL_URL=https://storage.googleapis.com/mediapipe-models/hand_landmarker/hand_landmarker/float16/1/hand_landmarker.task

mkdir -p "$DEST/wasm"
tmp=$(mktemp -d)
trap 'rm -rf "$tmp"' EXIT
(cd "$tmp" && npm pack "@mediapipe/tasks-vision@$VERSION" --silent >/dev/null && tar xzf ./*.tgz)
cp "$tmp"/package/vision_bundle.mjs "$DEST/"
cp "$tmp"/package/wasm/vision_wasm_internal.js "$tmp"/package/wasm/vision_wasm_internal.wasm \
   "$tmp"/package/wasm/vision_wasm_nosimd_internal.js "$tmp"/package/wasm/vision_wasm_nosimd_internal.wasm \
   "$DEST/wasm/"
curl -fsSL --retry 3 -o "$DEST/hand_landmarker.task" "$MODEL_URL"
ls -la "$DEST" "$DEST/wasm"
