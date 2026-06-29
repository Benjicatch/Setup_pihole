# Update package list
apt-get update
apt-get install -y python3.6
python -m ensurepip --upgrade


# Setup github for cloning repositories
apt-get install -y git
ssh-keyscan github.com >> ~/.ssh/known_hosts
sudo apt install -y pipx
pipx ensurepath
# exec $SHELL
pipx install ansible-core
ansible --version

REPO_DIR="/home/vagrant/Setup_pihole"

# Clone Setup_pihole repository if it doesn't exist
if [ ! -d "$REPO_DIR/.git" ]; then
  rm -rf "$REPO_DIR"
  git clone git@github.com:Benjicatch/Setup_pihole.git "$REPO_DIR"
fi

git config --global --add safe.directory "$REPO_DIR"

cd "$REPO_DIR"

# Always ensure we're on the dev branch and up to date
git fetch origin
git checkout dev
git pull origin dev

cd ansible
ansible-galaxy install -r ./requirements.yml
ansible-playbook -i "localhost," -c local ./playbook.yml --vault-password-file /home/vagrant/.password
