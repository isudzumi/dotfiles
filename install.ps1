#�Ǘ��Ҍ����Ŏ��s
try{
    ni -Path $HOME -Name .vimrc -Value .vimrc -ItemType SymbolicLink
    ni -Path $HOME -Name .vim -Value .vim -ItemType SymbolicLink
} catch {
    Write-Error("�G���[" + $_.Error)
} 
