mkdir Desktop
mkdir Documents
mkdir Downloads
mkdir Pictures
mkdir Videos
mkdir Music

for i in {1..5}
do
	mkdir folder"$i"
done

file="uporabniki.txt"
while read line;
do
	sudo useradd -m "$line"
	sudo usermod -aG sudo "$line"
done<"$file"

sudo apt-get update
sudo apt-get upgrade

sudo apt install ufw
sudo apt install git
sudo apt install nginx
sudo apt install net-tools

sudo apt-get update
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
	
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  
sudo apt update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
sudo docker run hello-world