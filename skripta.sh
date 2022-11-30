file="uporabniki.txt"
while read line;
do
	sudo useradd -m $line
	sudo usermod -aG sudo $line
done<"$file"