# Update package list
apt-get update

# Setup github for cloning repositories
apt-get install -y git
echo "add host"
ssh-keyscan github.com >> ~/.ssh/known_hosts
echo "finish add host"

# Clone Setup_pihole repository if it doesn't exist
if [ ! -d "~/Setup_pihole/.git" ]; then
  cd ~/
  rm -rf Setup_pihole
  git clone git@github.com:Benjicatch/Setup_pihole.git
  cd Setup_pihole
  git checkout main
fi
