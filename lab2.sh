#!/bin/bash
# Förbered mappstruktur
installmapp=$(pwd)
grundmapp="laboration2"
undermappar=("katalog-1" "katalog-tva")
#Skapa cleanup skalprogram
cat > cleanup.sh <<EOF
#!/bin/bash
echo Rensar upp efter laboration2
rm -rf laboration2 filett.txt cleanup.sh
echo Klart! Tack för visat intresse!
EOF
chmod +x cleanup.sh
# Kontrollera om tidigare mappstruktur finns, ta bort isåfall.
if [ -d $grundmapp  ] ; then
echo Hittade tidigare $grundmapp, tar bort den!
rm -rf $grundmapp
fi
# Kontrollera filett.txt, ta bort isf!
if [ -f filett.txt ] ; then
echo Hittade tidigare filett.txt, tar bort den!
rm -rf filett.txt
fi
# Skapa filett.txt med innehåll 'fil ett'
echo "fil ett" > filett.txt
# Skapa mappstruktur, jag valde loop istället för "mkdir -p"
mkdir -p $grundmapp
# Ställ skalprogrammet i grundmappen som vi precis skapade
cd $grundmapp
# Skapa två textfiler som innehåller text
echo "fil två" > filtvaa.txt
echo "fil tre" > filtree.txt
# Loopa igenom array (undermappar) och skapa dess mappar
for mapp in ${undermappar[@]} ; do
mkdir $mapp
done
# Ställ skalprogrammet i katalog-1
cd ${undermappar[0]}
# Skapa datafil.txt under katalog-1 med HERE-metoden
cat > datafil.txt <<EOF
Det här är datafil.txt i ${undermappar[0]}
Den kommer användas till att räkna rader
EOF
# Skapa skalprogrammet pgm.sh under katalog-1
cat > pgm.sh <<EOF
#!/bin/bash
# Sätt installationsmapp där pgm.sh ska köras
installkat=$installmapp/$grundmapp
# Om aktuell katalog INTE är densamma som installationsmappen, byt mapp med cd
if [ pwd != \$installkat/${undermappar[0]} ] ; then
cd \$installkat/${undermappar[0]}; fi
# Räkna antal rader för mapp[0] som är katalog-1
norows1=(\$(wc -l \$installkat/${undermappar[0]}/datafil.txt))
# Skriv ut antal rader som datafil.txt innehåller i katalog-1
echo -e Antal rader i datafil.txt i ${undermappar[0]}:\\\n"\$norows1"st\\\n
# Räkna antal rader för mapp [1] som är katalog-tva 
norows2=(\$(wc -l \$installkat/${undermappar[1]}/datafil.txt))
# Skriv ut antal rader som datafil.txt innerhåller i katalog-tva
echo -e Antal rader i datafil.txt i ${undermappar[1]}:\\\n"\$norows2"st\\\n
# Skriv ut antal rader från datafil.txt från katalig-1 samt katalog-tva
echo -e Totalt antal rader från båda datafil.txt i ${undermappar[0]} och ${undermappar[1]}:\\\n\$((\$norows1 + \$norows2))st\\\n
EOF
# Gör pgm.sh exekverbar
chmod +x pgm.sh
# Gå tillbaka ett steg från katalogen katalog-1
cd ..
# Byt katalog till katalog-tva
cd ${undermappar[1]}
# Skapa datafil.txt under katalog-tva med HERE-metoden
cat > datafil.txt <<EOF
Det här är datafil.txt i ${undermappar[1]}
Den kommer användas till att räkna rader
Och den får innehålla tre(!) rader
EOF
# S¨kapa textfil som innehåller en rad text
echo "fil fyra" > filfyra.txt
exit
