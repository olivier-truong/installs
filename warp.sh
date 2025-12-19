apt update
apt install curl gpg lsb-release -y

# Add cloudflare gpg key 
curl -fsSL https://pkg.cloudflareclient.com/pubkey.gpg | gpg --yes --dearmor --output /usr/share/keyrings/cloudflare-warp-archive-keyring.gpg

# Add this repo to your apt repositories
echo "deb [signed-by=/usr/share/keyrings/cloudflare-warp-archive-keyring.gpg] https://pkg.cloudflareclient.com/ $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/cloudflare-client.list

# Install
apt-get update && apt-get install cloudflare-warp -y

nohup warp-svc &> nohup.out &
sleep 3

echo "y" | warp-cli registration new
echo "y" | warp-cli connect

# warp-cli disconnect
