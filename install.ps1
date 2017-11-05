#ä«óùé“å†å¿Ç≈é¿çs
try{
    ni -Path $HOME -Name .vimrc -Value .vimrc -ItemType SymbolicLink
    ni -Path $HOME -Name .vim -Value .vim -ItemType SymbolicLink
} catch {
    Write-Error("ÉGÉâÅ[" + $_.Error)
} 
