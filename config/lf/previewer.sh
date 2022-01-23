#!/bin/sh
draw() {
  ~/.config/lf/draw_img.sh "$@"
  exit 1
}

hash() {
  printf '%s/.cache/lf/%s' "$HOME" \
    "$(stat --printf '%n\0%i\0%F\0%s\0%W\0%Y' -- "$(readlink -f "$1")" | sha256sum | awk '{print $1}')"
}

cache() {
  if [ -f "$1" ]; then
    draw "$@"
  fi
}

case "$1" in
	*.tgz|*.tar.gz) tar tzf "$1";;
	*.tar.bz2|*.tbz2) tar tjf "$1";;
	*.tar.txz|*.txz) xz --list "$1";;
	*.tar) tar tf "$1";;
	*.zip|*.jar|*.war|*.ear|*.oxt) unzip -l "$1";;
	*.rar) unrar l "$1";;
	*.7z) 7z l "$1";;
	*.[1-8]) man "$1" | col -b ;;
	*.o) nm "$1" | less ;;
	*.iso) iso-info --no-header -l "$1";;
	*.odt,*.ods,*.odp,*.sxw) odt2txt "$1";;
	*.doc) catdoc "$1" ;;
	*.docx) docx2txt "$1" - ;;
	*.csv) cat "$1" | sed s/,/\\n/g ;;
	*.wav|*.mp3|*.flac|*.m4a|*.wma|*.ape|*.ac3|*.og[agx]|*.spx|*.opus|*.as[fx]|*.flac) exiftool "$1";;
    *.pdf) pdftotext -l 10 -nopgbrk -q -- "$1" - ;;
	*) highlight --out-format ansi "$1" || cat "$1";;
esac

file="$1"
shift

if [ -n "$FIFO_UEBERZUG" ]; then
  case "$(file -Lb --mime-type -- "$file")" in
    image/*)
      orientation="$(identify -format '%[EXIF:Orientation]\n' -- "$file")"
      if [ -n "$orientation" ] && [ "$orientation" != 1 ]; then
        cache="$(hash "$file").jpg"
        cache "$cache" "$@"
        convert -- "$file" -auto-orient "$cache"
        draw "$cache" "$@"
      else
        draw "$file" "$@"
      fi
      ;;
    video/*)
      cache="$(hash "$file").jpg"
      cache "$cache" "$@"
      ffmpegthumbnailer -i "$file" -o "$cache" -s 0
      draw "$cache" "$@"
      ;;
  esac
fi

file -Lb -- "$1" | fold -s -w "$width"
exit 0
