param(
        [Parameter(
                    Mandatory=$true,
                    Position=0,
                    HelpMessage='Set path variable')]
        [string] $w
)

$pdfs = ls $w -recurse | where {-not $_.PSIsContainer -and $_.Extension -imatch "^\.pdf$"};

[void] [System.Reflection.Assembly]::LoadFrom(
    [System.IO.Path]::Combine($modules, 'itextsharp.dll')
);

$output = [System.IO.Path]::Combine($w, 'output.pdf');
$fileStream = New-Object System.IO.FileStream($output, [System.IO.FileMode]::OpenOrCreate);
$document = New-Object iTextSharp.text.Document;
$pdfCopy = New-Object iTextSharp.text.pdf.PdfCopy($document, $fileStream);
$document.Open();

foreach ($pdf in $pdfs) {
    $reader = New-Object iTextSharp.text.pdf.PdfReader($pdf.FullName);
    $pdfCopy.AddDocument($reader);
    $reader.Dispose();  
}

$pdfCopy.Dispose();
$document.Dispose();
$fileStream.Dispose();