# Update package list
apt-get update
apt-get install -y python3.6
python -m ensurepip --upgrade


# Setup github for cloning repositories
apt-get install -y git
ssh-keyscan github.com >> ~/.ssh/known_hosts
sudo apt install -y pipx
pipx ensurepath
exec $SHELL
