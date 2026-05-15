# Update package list
apt-get update

# Setup github for cloning repositories
apt-get install -y git
ssh-keyscan github.com >> ~/.ssh/known_hosts
apt-get install -y ansible

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

ansible-playbook -i "localhost," -c local ./ansible/playbook.yml
