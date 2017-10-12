$scripts = "$(split-path $profile)\scripts"
$modules = "$(split-path $profile)\modules"
$docs    =  $(resolve-path "$Env:userprofile\documents")
$desktop =  $(resolve-path "$Env:userprofile\desktop")

$env:path += ";$Scripts"