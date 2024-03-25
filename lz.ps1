Write-Host "Paste leakedzone.com profile page (ex. https://leakedzone.com/sweetiefox_of) and press enter"

$Url = Read-Host
$Name = ([uri]$Url).Segments[-1].Trim('/')

New-Item -ItemType Directory -Force -Path ($Name + "\Photos\")
New-Item -ItemType Directory -Force -Path ($Name + "\Videos\")

$headers = @{
'Accept-Encoding' = 'gzip, deflate'
'Cookie' = 'XSRF-TOKEN=CHANGETHIS;cf_clearance=CHANGETHIS; leakedzone_session=CHANGETHIS'
'X-Requested-With' = 'XMLHttpRequest'
}

$i = 0
While ($True) {
    $x = Invoke-WebRequest "$($Url)?page=$($i)&type=photos&order=0" -headers $headers 
    $i++
    $A = ($x.content | ConvertFrom-Json)
    if (-not $A) { break }
    
    foreach ($item in $A) {
        $photourl = "https://img.leakedzone.com/storage/" + $item.image
        if (-not $photourl) { continue }
        
        $filename = $Name + "\Photos\" + ([uri]$photourl).Segments[-1]
        if (-not (Test-Path $filename -PathType Leaf)) {
            Invoke-WebRequest -Uri $photourl -Outfile $filename
        }
    }
}

$i = 0
While ($True) {
    $x = Invoke-WebRequest "$($Url)?page=$($i)&type=videos&order=0" -headers $headers
    $i++
    $A = ($x.content | ConvertFrom-Json)
    if (-not $A) { break }
    
    foreach ($item in $A) {
        $videourl = $item.stream_url_play
        $slug = $item.slug
        if (-not $videourl) { continue }

        $videourl = $videourl.Substring(16, $videourl.Length - 32)
        $videourl = $videourl[-1..-$videourl.Length] -join ''
        $videourl = [Text.Encoding]::Utf8.GetString([Convert]::FromBase64String($videourl))
        write-Host $videourl
        yt-dlp $videourl -o "$Name\Videos\$slug.%(ext)s" 
    }
}
