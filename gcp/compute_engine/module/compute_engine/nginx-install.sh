# Update repositories
sudo apt-get update

# Install NGINX
sudo apt-get install nginx -y

# Configure firewall
# Uncomment out the line that meets your needs
sudo ufw allow 'Nginx Full' # both ports 80 and 443
# sudo ufw allow 'Nginx HTTP' # port 80 only
# sudo ufw allow 'Nginx HTTPS' # port 443 only

# Uncomment to disable default virtual host
#unlink /etc/nginx/sites-enabled/default
