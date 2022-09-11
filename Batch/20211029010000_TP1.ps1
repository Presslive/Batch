<#  Auteur: Diallo Abdoulaye
    Date: 2021-10-21
    But:Création des utilisateurs
    Création des groupes
    Création des dossiers
    Respect et utilisation judicieuse des droits d’accès
    Création des partages
 #>


                                        <#---------------- Création des utilisateurs -------------------#>

        
$prenom_eleves=@("Ansel","Devin","Sergeant","Elston","Aldis","Leia","Yance","Debbie","Charin","Jada",
"Clary","Britt","Dar","Carmon","Fran","Natalina","Shelly","Hector","Alena","Calla","Alli","Gav","Bennie",
"Ruddie","Karina","Geralda","Homer","Luke","Terri","Jameson")

$nom_eleves=@("Mullaney","Giacomini","Downey","Readwood","Nelane","Mattin","Norkett","Headey","Craigheid",
"Rubinchik","Ilott","Riehm","Louis","Crissil","Lergan","Boyat","Whaites","Boyford","Reddings","Biford","Minger",
"Biernat","Brickhill","Domokos","Strauss","McAster","Smieton","Gogan","Jerzycowski","Jinkin")

<# Creation des noms d'utilisateurs ex:amullaney #>
for ($i = 0; $i -lt $prenom_eleves.Count; $i++){ 
 $firstName = $prenom_eleves[$i] # Sylvie
 $lastName = $nom_eleves[$i] # Gauthier
 $premierlettrePren = $firstName[0] # S
 $firstNameFirstLetterLowerCase = $premierlettrePren.ToLower() # s
 $lastNameLowerCase = $lastName.ToLower() # gauthier
 $utilisateur = $firstNameFirstLetterLowerCase + $lastNameLowerCase # sgauthier
 New-LocalUser -Name $utilisateur -FullName "$firstName $lastName" -NoPassword}
 <# Write-Output $utilisateur #>

 <# creation des noms complets #>

  for ($i = 0; $i -lt $prenom_eleves.Count; $i++){

    $nom_complet=$prenom_eleves[$i]+" "+$nom_eleves[$i]
 }

                                          # Creation des groupes pour gestion des droits

$groupTechniciens = "gTechniciens"
$groupArtistes = "gArtistes"
$groupProgrammeurs = "gProgrammeurs"
$groupEmpl_Admin = "gEmpl_Admin"

New-LocalGroup -Name $groupTechniciens
New-LocalGroup -Name $groupArtistes
New-LocalGroup -Name $groupProgrammeurs
New-LocalGroup -Name $groupEmpl_Admin

<# Administrateurs #>
 <# j'ai eu du mal avec les 4 loops de chaque groupes donc c'est long!! #>
$utilisateur = "amullaney"
Add-LocalGroupMember -Group $groupTechniciens -Member $utilisateur
$utilisateur = "dgiacomini"
Add-LocalGroupMember -Group $groupTechniciens -Member $utilisateur
$utilisateur = "sdowney"
Add-LocalGroupMember -Group $groupTechniciens -Member $utilisateur
$utilisateur = "ereadwood"
Add-LocalGroupMember -Group $groupEmpl_Admin -Member $utilisateur
$utilisateur = "anelane"
Add-LocalGroupMember -Group $groupEmpl_Admin -Member $utilisateur

$utilisateur = "lmattin"
Add-LocalGroupMember -Group $groupEmpl_Admin -Member $utilisateur

$utilisateur = "ynorkett"
Add-LocalGroupMember -Group $groupEmpl_Admin -Member $utilisateur

$utilisateur = "dheadey"
Add-LocalGroupMember -Group $groupEmpl_Admin -Member $utilisateur

$utilisateur = "ccraigheid"
Add-LocalGroupMember -Group $groupArtistes -Member $utilisateur

$utilisateur = "jrubinchik"
Add-LocalGroupMember -Group $groupArtistes -Member $utilisateur

$utilisateur = "cilott"
Add-LocalGroupMember -Group $groupArtistes -Member $utilisateur

$utilisateur = "briehm"
Add-LocalGroupMember -Group $groupArtistes -Member $utilisateur

$utilisateur = "dlouis"
Add-LocalGroupMember -Group $groupArtistes -Member $utilisateur

$utilisateur = "ccrissil"
Add-LocalGroupMember -Group $groupArtistes -Member $utilisateur

$utilisateur = "flergan"
Add-LocalGroupMember -Group $groupArtistes -Member $utilisateur

$utilisateur = "nboyat"
Add-LocalGroupMember -Group $groupArtistes -Member $utilisateur

$utilisateur = "swhaites"
Add-LocalGroupMember -Group $groupArtistes -Member $utilisateur

$utilisateur = "hboyford"
Add-LocalGroupMember -Group $groupArtistes -Member $utilisateur

$utilisateur = "areddings"
Add-LocalGroupMember -Group $groupProgrammeurs -Member $utilisateur

$utilisateur = "cbiford"
Add-LocalGroupMember -Group $groupProgrammeurs -Member $utilisateur

$utilisateur = "aminger"
Add-LocalGroupMember -Group $groupProgrammeurs -Member $utilisateur

$utilisateur = "gbiernat"
Add-LocalGroupMember -Group $groupProgrammeurs -Member $utilisateur
$utilisateur = "bbrickhill"
Add-LocalGroupMember -Group $groupProgrammeurs -Member $utilisateur
$utilisateur = "rdomokos"
Add-LocalGroupMember -Group $groupProgrammeurs -Member $utilisateur
$utilisateur = "kstrauss"
Add-LocalGroupMember -Group $groupProgrammeurs -Member $utilisateur
$utilisateur = "gmcAster"
Add-LocalGroupMember -Group $groupProgrammeurs -Member $utilisateur
$utilisateur = "hsmieton"
Add-LocalGroupMember -Group $groupProgrammeurs -Member $utilisateur
$utilisateur = "lgogan"
Add-LocalGroupMember -Group $groupProgrammeurs -Member $utilisateur
$utilisateur = "tjerzycowski"
Add-LocalGroupMember -Group $groupProgrammeurs -Member $utilisateur
$utilisateur = "jjinkin"
Add-LocalGroupMember -Group $groupProgrammeurs -Member $utilisateur


      <# Creation dossier #>

      <# Public #>
      New-Item -Path 'c:\public' -ItemType Directory
      New-Item -Path 'c:\public\intranet' -ItemType Directory
      New-Item -Path 'c:\public\commun' -ItemType Directory
      <# Droits d'acces #>
      <# icacls.exe "c:/public" /grant $utilisateur":(CI)(OI)(F)" #>

         <# Departement #>
      New-Item -Path 'c:\departements' -ItemType Directory
      $departements=@("administration","programmeurs","artistes","techniciens")
         foreach ($depart in $departements){
            New-Item -Path 'c:\departements' -ItemType Directory
         }



         <# Projets #>
         New-Item -Path 'c:\projets'
         $projets=@("A","B","C")
         foreach ($projet in $projets){
            New-Item -Path 'c:\projets' -ItemType Directory
         }

         <# Projets\A #>
        $DossierA=@("artistes","programmeurs","commun"){

         New-Item -Path 'c:\projets\A' -ItemType Directory
        }

         <# Perso #>
        New-Item -Path 'c:\perso' -ItemType Directory

        foreach ($projet in $projets){
         New-Item -Path 'c:\perso' -ItemType Directory
      }

                                                 <#----------------- Droits d'acces----------------- #>

      <# \public #>
   icacls.exe "c:/public" /grant $groupTechniciens":(OI)(CI)(F)"
   icacls.exe "c:/public" /grant $groupArtistes":(OI)(CI)(F)"
   icacls.exe "c:/public" /grant $groupProgrammeurs":(OI))(CI)(F)"
   icacls.exe "c:/public" /grant $groupEmpl_Admin":(OI))(CI)(F)"
   
   <# \public\intranet #>
   icacls.exe "c:/public\intranet" /grant $groupTechniciens":(CI)(RX)"
   icacls.exe "c:/public\intranet" /grant $groupArtistes":(CI)(RX)"
   icacls.exe "c:/public\intranet" /grant $groupProgrammeurs":(CI)(RX)"
   icacls.exe "c:/public\intranet" /grant $groupEmpl_Admin":(CI)(RX)(M)"
   
   <# \public\commun #>
   icacls.exe "c:/public\commun" /grant $groupTechniciens":(OI)(CI)(F)"
   icacls.exe "c:/public\commun" /grant $groupArtistes":(OI)(CI)(F)"
   icacls.exe "c:/public\commun" /grant $groupProgrammeurs":(OI))(CI)(F)"
   icacls.exe "c:/public\commun" /grant $groupEmpl_Admin":(OI))(CI)(F)"
   
      <# \departements #>
      icacls.exe "c:/departements" /grant $groupTechniciens":(OI)(CI)(F)"
      icacls.exe "c:/departements" /grant $groupArtistes":(OI)(CI)(F)"
      icacls.exe "c:/departements" /grant $groupProgrammeurs":(OI))(CI)(F)"
      icacls.exe "c:/departements" /grant $groupEmpl_Admin":(OI))(CI)(F)"
      
      <# \departements\administration #>
      icacls.exe "c:/departements\administration" /remove $groupTechniciens
      icacls.exe "c:/departements\administration" /remove $groupArtistes
      icacls.exe "c:/departements\administration" /remove $groupProgrammeurs
      icacls.exe "c:/departements\administration" /grant $groupEmpl_Admin":(OI))(CI)(F)"


      <# \departements\programmeurs #>
      icacls.exe "c:/departements\programmeurs" /remove $groupTechniciens
      icacls.exe "c:/departements\programmeurs" /remove $groupArtistes
      icacls.exe "c:/departements\programmeurs" /grant  $groupProgrammeurs":(OI))(CI)(F)"
      icacls.exe "c:/departements\programmeurs" /remove $groupEmpl_Admin
      
      <# \departements\artistes #>
      icacls.exe "c:/departements\artistes" /remove $groupTechniciens
      icacls.exe "c:/departements\artistes" /grant $groupArtistes":(OI))(CI)(F)"
      icacls.exe "c:/departements\artistes" /remove $groupProgrammeurs
      icacls.exe "c:/departements\artistes" /remove $groupEmpl_Admin

       <# \departements\techniciens  #>
       icacls.exe "c:/departements\techniciens" /grant $groupTechniciens":(OI))(CI)(F)"
       icacls.exe "c:/departements\techniciens" /remove $groupArtistes
       icacls.exe "c:/departements\techniciens" /remove $groupProgrammeurs
       icacls.exe "c:/departements\techniciens" /remove $groupEmpl_Admin


         <# \projets #>
      icacls.exe "c:/projets" /grant $groupTechniciens":(OI)(CI)(F)"
      icacls.exe "c:/projets" /grant $groupArtistes":(OI)(CI)(F)"
      icacls.exe "c:/projets" /grant $groupProgrammeurs":(OI))(CI)(F)"
      icacls.exe "c:/projets" /grant $groupEmpl_Admin":(OI))(CI)(F)"
      
      <# c:/projets/A/artistes #>
       icacls.exe "c:/projets/A/artistes" /remove $groupTechniciens
       icacls.exe "c:/projets/A/artistes" /grant $groupArtistes":(OI))(CI)(F)"
       icacls.exe "c:/projets/A/artistes" /remove $groupProgrammeurs
       icacls.exe "c:/projets/A/artistes" /remove $groupEmpl_Admin

      <# c:/projets/A/programmeurs #>
      icacls.exe "c:/projets/A/programmeurs" /remove $groupTechniciens
      icacls.exe "c:/projets/A/programmeurs" /remove $groupArtistes
      icacls.exe "c:/projets/A/programmeurs" /grant  $groupProgrammeurs":(OI))(CI)(F)"
      icacls.exe "c:/projets/A/programmeurs" /remove $groupEmpl_Admin

       <# c:/projets/A/commun #>

       icacls.exe "c:/projets/A/commun" /grant $groupTechniciens":(OI)(CI)(F)"
      icacls.exe "c:/projets/A/commun" /grant $groupArtistes":(OI)(CI)(F)"
      icacls.exe "c:/projets/A/commun" /grant $groupProgrammeurs":(OI))(CI)(F)"
      icacls.exe "c:/projets/A/commun" /grant $groupEmpl_Admin":(OI))(CI)(F)"


                                             <#---------------- Partages------------------- #>

      <# Public #>

      New-SmbShare -Name "PUBLIC" -Path "c:/public" -FullAccess "Everyone" -CachingMode None 

     <# Départements #>
     New-SmbShare -Name "ADMINISTRATION$" -Path "c:/departements/administration" -FullAccess $groupEmpl_Admin
     New-SmbShare -Name "PROGRAMMEURS$" -Path "c:/departements/programmeurs" -FullAccess $groupProgrammeurs
     New-SmbShare -Name "ARTISTES$" -Path "c:/departements/artistes" -FullAccess $groupArtistes
     New-SmbShare -Name "TECHNICIENS$" -Path "c:/departements/techniciens" -FullAccess $groupTechniciens

      <# Projets #>

     New-SmbShare -Name "A$" -Path "c:/projets/A" -ConcurrentUserLimit 200
     New-SmbShare -Name "B$" -Path "c:/projets/B" -ConcurrentUserLimit 200
     New-SmbShare -Name "C$" -Path "c:/projets/C" -ConcurrentUserLimit 200

     <# Perso #>
     New-SmbShare -Name "A$" -Path "c:/perso/A" -ConcurrentUserLimit 10
     New-SmbShare -Name "B$" -Path "c:/perso/B" -ConcurrentUserLimit 10
     New-SmbShare -Name "C$" -Path "c:/perso/C" -ConcurrentUserLimit 10

     

     
