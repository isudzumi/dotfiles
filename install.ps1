#管理者権限で実行
try{
    ni -Path $HOME -Name .vimrc -Value .vimrc -ItemType SymbolicLink
    ni -Path $HOME -Name .vim -Value .vim -ItemType SymbolicLink
    ni -Path $HOME -Name .gitconfig -Value .vim -ItemType SymbolicLink
} catch {
    Write-Error("エラー" + $_.Error)
} 
