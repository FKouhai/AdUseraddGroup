Write-Host "Para usar este script solo se necesita un fichero csv con el user id y el nombre del grupo"

$ruta=Read-Host "Introduce la ruta del fichero csv(fichero que contiene los usuarios)"
$fichero= Import-csv -Path $ruta
$grupo=Read-host "Introduce el nombre de los grupos de seguridad"
foreach($user in $fichero){
    Add-ADGroupMember -Identity $user  -Members $user  
}