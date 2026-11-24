#!/bin/bash
set -e
SRC="C:/Users/Administrator/.workbuddy/skills/做封面/assets/模板二.svg"
TMPDIR="$(cygpath -m "${LOCALAPPDATA}/Temp")"
SVGF="${TMPDIR}/cover_hs750d.svg"
cp "$SRC" "$SVGF"

# 渐变 1~9 阶（主色 #0891B2 湖蓝 白化）
sed -i 's/stop-color="#fdfefe"/stop-color="#F3FAFB"/g' "$SVGF"
sed -i 's/stop-color="#f6fbfc"/stop-color="#E6F4F7"/g' "$SVGF"
sed -i 's/stop-color="#ebf7f8"/stop-color="#DAEFF3"/g' "$SVGF"
sed -i 's/stop-color="#daf0f2"/stop-color="#C1E4EC"/g' "$SVGF"
sed -i 's/stop-color="#c4e7eb"/stop-color="#A9D9E4"/g' "$SVGF"
sed -i 's/stop-color="#a8dce2"/stop-color="#84C8D9"/g' "$SVGF"
sed -i 's/stop-color="#88cfd7"/stop-color="#5EB8CD"/g' "$SVGF"
sed -i 's/stop-color="#64c0ca"/stop-color="#39A7C1"/g' "$SVGF"
sed -i 's/stop-color="#3bb0bd"/stop-color="#219CBA"/g' "$SVGF"
sed -i 's/#39afbc/#0891B2/g' "$SVGF"

# 文本（presets 第 2 套：高数题集/宋浩编/750题）
sed -i 's/8个很棒的/高数题集/' "$SVGF"
sed -i 's/>VUE</>宋浩编</' "$SVGF"
sed -i 's/开发技巧哈哈/750题/' "$SVGF"
sed -i 's/五字以内啊/考研必备/' "$SVGF"
sed -i 's/标签左/真题改编/' "$SVGF"
sed -i 's/标签右/难度分级/' "$SVGF"
sed -i 's/（收藏）/（数学）/' "$SVGF"

echo "--- 残留检查 ---"
grep -c "8个很棒的\|开发技巧哈哈\|五字以内啊\|标签左\|标签右\|（收藏）" "$SVGF" || echo "0 残留"
grep -o "高数题集\|宋浩编\|750题\|考研必备\|真题改编\|难度分级\|（数学）" "$SVGF" | sort | uniq -c

SVG=$(cat "$SVGF")
printf '<!DOCTYPE html><html><head><meta charset="utf-8"><style>body{margin:0;background:#fff;}svg{width:1080px;height:1440px;display:block;}</style></head><body>%s</body></html>' "$SVG" > "${TMPDIR}/cover_hs750d.html"
ls -la "${TMPDIR}/cover_hs750d.html"
