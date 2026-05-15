# Update package list
apt-get update

# Setup github for cloning repositories
apt-get install -y git

ssh-keyscan github.com >> ~/.ssh/known_hosts

apt-get install -y ansible

# Clone Setup_pihole repository if it doesn't exist
if [ ! -d "/home/vagrant/Setup_pihole/.git" ]; then
  cd /home/vagrant/
  rm -rf Setup_pihole
  git clone git@github.com:Benjicatch/Setup_pihole.git
  cd Setup_pihole
  git checkout dev
fi

cd Setup_pihole
git pull

ansible-playbook -i "localhost," -c local ./ansible/playbook.yml
