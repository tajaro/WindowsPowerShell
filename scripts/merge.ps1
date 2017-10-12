$w = Get-Location

& $scripts\convert-doc-to-pdf.ps1 $w
& $scripts\combine-pdf.ps1 $w