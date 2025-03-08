#!/bin/bash
# Rensa upp konsollen först.
clear
# Ställ frågan om vi vill rensa bort ~/tmp mappen innan vi fortsätter
if [ -d ~/tmp ]; then
read -e -p "Hittade tidigare ~/tmp mapp, vill du ta bort den innan vi fortsätter? [j/n] " valet
# Om svaret är J eller j, fortsätt med att ta bort
if [[ "$valet" == [Jj]* ]]; then
rm -rf ~/tmp && echo "Lyckades att ta bort ~/tmp" || echo "Gick inte att ta bort ~/tmp !! Why, I don't know?"
fi
fi
# Skapa katalog-/filstruktur i hemmamappen
mkdir -p ~/tmp/del3/{a1,a3}
cd ~/tmp/del3
# Skapa filerna a2 och a4
sudo touch {a2,a4}
# Ändra rättigheterna på /a1 till enbart ägaren
sudo chmod u=rwx,go= a1
# Ändra ägaren till katalogen till root
sudo chown root a1
# Ändra grupp för filen a2 till root
sudo chown deltva:root a2
# Lägg till rättighet så filen blir exekverbar
sudo chmod u+x a2
# Ändra rättigheter för mappen a3 för användare, grupp och andra enligt nedan
sudo chmod u=rwx,go=r a3
# Ändra rättigheter för filen a4 enligt nedan
sudo chmod ug=rwx,o= a4
# Ändra ägare och grupp till root
sudo chown root:root a4
# Meddela att scriptet är klart.
echo "Skalprogrammet har körts klart"
