param (
	[string]$dir = $( Read-Host "Input directory" ),
	[int]$n = $( Read-Host "Input file number" )
)
$n = $n + 1

$files = Get-ChildItem -path $dir -Name

$count = 1
for ($i=1; $i -lt $files.Count; $i++) {
	if($files[$i-1].Substring(0,7) -eq $files[$i].Substring(0,7)){
		$count = $count + 1
	}
	else{
		if($count -gt $n){
			Write-Host $files[$i-1].Substring(0,7) ($count - $n) "file(s) duplicated."
		}
		$count = 1
	}
}