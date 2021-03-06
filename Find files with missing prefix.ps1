# This snippets searches for files with a missing prefix (in this case yyyyMMdd), takes the creation date of the file and adds this to the filename

Get-Childitem "C:\Users\p.terlisten\Documents" -recurse | Where-Object {$_.FullName -notlike "*Vorlagen*"} | Get-ChildItem -File | Where-Object {$_.name -notmatch '^\d{8}'} | ForEach-Object {

    $creationtime = $_.CreationTime
    $newdate = $creationtime.ToString("yyyyMMdd")
    $filename = $_.Name

    rename-item -LiteralPath $_.FullName -newname "$newdate $filename"

}