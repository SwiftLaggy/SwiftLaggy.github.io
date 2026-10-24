module github.com/hugo-fixit/FixIt

go 1.19

{{ $original := .Resources.GetMatch "OffSec.png" }}
{{ $resized := $original.Resize "600x webp" }}

<img src="{{ $resized.RelPermalink }}" width="{{ $resized.Width }}" height="{{ $resized.Height }}" alt="Resized image">