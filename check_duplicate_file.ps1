param (
	[string]$dir = $( Read-Host "Input directory (ex. C:\kadai\)" ),
	[int]$num = $( Read-Host "Input file number (ex. 1)" ),
	[string]$type = $( Read-Host "Input file type (ex. .pdf,.doc,.docx)" ),
	[int]$std = $( Read-Host "Input student number (ex. 138)" )
)

$num = $num + 1
$t = $type.split(' ')
$t += '.txt'

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
echo '================================'
echo ''
echo 'NON-SUBMISSION STUDENT NUMBER'
echo ''

$index = 0
if([int]($files[0].Substring(4,3)) -ne 1){
	for ($j=1; $j -lt [int]($files[1].Substring(4,3)); $j++){
		$n = $files[0].Substring(0,4) + ("{0:D3}" -f $j)
		echo $n
	}
}	
for ($i=1; $i -lt $files.Count; $i++){
	if([int]($files[$i].Substring(4,3))-[int]($files[$i-1].Substring(4,3)) -gt 1){
		for ($j=[int]($files[$i-1].Substring(4,3))+1; $j -lt [int]($files[$i].Substring(4,3)); $j++){
			$n = $files[$i].Substring(0,4) + ("{0:D3}" -f $j)
			echo $n
		}
	}
}
if([int]($files[$files.Count-1].Substring(4,3)) -ne $std){
	for ($j=[int]($files[$files.Count-1].Substring(4,3))+1; $j -lt $std+1; $j++){
		$n = $files[$files.Count-1].Substring(0,4) + ("{0:D3}" -f $j)
		echo $n
	}
}	
echo ''
