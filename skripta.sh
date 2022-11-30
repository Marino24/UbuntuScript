file="/home/vivek/uporabniki.txt"
while IFS= read -r line
do
	sudo useradd -m $line
	sudo usermod -aG sudo $line
done<"$file"