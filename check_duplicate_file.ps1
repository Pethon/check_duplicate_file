param (
	[string]$dir = $( Read-Host "Input directory (ex. C:\kadai\)" ),
	[int]$num = $( Read-Host "Input file number (ex. 1)" ),
	[string]$type = $( Read-Host "Input file type (ex. .pdf,.doc,.docx)" )
)

$num = $num + 1
$t = $type.split(' ')

echo ''
echo 'DUPLICATED FILE'
echo ''

$files = Get-ChildItem -path $dir -Name

$count = 1
for ($i=1; $i -lt $files.Count; $i++) {
	if($files[$i-1].Substring(0,7) -eq $files[$i].Substring(0,7)){
		$count = $count + 1
	}
	else{
		if($count -gt $num){
			Write-Host $files[$i-1].Substring(0,7) ($count - $num) "file(s) duplicated."
		}
		$count = 1
	}
}

echo ''
echo '================================'
echo ''
echo 'WRONG FILE FORMAT'
echo ''

for ($i=0; $i -lt $files.Count; $i++){
	if(!($null -ne ($t | ? { $files[$i] -match $_ }))){
		echo $files[$i]
	}
}
echo ''
