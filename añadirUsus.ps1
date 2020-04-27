Write-Host "Para usar este script solo se necesita un fichero csv con el user id y el nombre del grupo"
function vars{
$ruta=Read-Host "Introduce la ruta del fichero csv(fichero que contiene los usuarios)"
$fichero= Import-Csv -Path $ruta
$grupo=Read-host "Introduce el nombre de los grupos de seguridad"
}
vars

if(Get-ADGroup -Identity $grupo){
    Write-Host "El grupo de AD existe"
    añadir
}
else{
    Write-Host "El grupo de AD no existe"
    #Llamamos a la funcion vars para volver a preguntar 
    #Por el grupo de AD
    vars
}


#Funcion para añadir a los usuarios al grupo de AD
#Se comprueba que los usuarios 
#No estan incluidos en el grupo de AD
function añadir {
foreach($user in $fichero){
    if (Get-ADPrincipalGroupMembership $usuario|select name | Where-Object name -ne $grupo){
        Add-ADGroupMember -Identity $grupo -Members $user  
}
    else{
    Write-Host "El usuario $user ya esta incluido en el grupo de seguridad"
    }
}
}
Write-Host "Para usar este script solo se necesita un fichero csv con el user id y el nombre del grupo"
function vars{
$ruta=Read-Host "Introduce la ruta del fichero csv(fichero que contiene los usuarios)"
$fichero= Import-Csv -Path $ruta
$grupo=Read-host "Introduce el nombre de los grupos de seguridad"
}
vars

