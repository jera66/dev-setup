1. Linux Dev Environment
Why Linux: Industry standard for servers, easier automation, better tooling for backend/cloud work.

Options:

Windows: Install WSL2 with Ubuntu 22.04

Mac: Already Unix-based, but install Ubuntu in Docker or a VM for consistency

Linux: Native → skip WSL

2. Git + GitHub Setup
Install & configure Git:

bash
Copy
Edit
sudo apt update
sudo apt install git
git config --global user.name "Your Name"
git config --global user.email "you@example.com"
Generate SSH key:

bash
Copy
Edit
ssh-keygen -t ed25519 -C "you@example.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
cat ~/.ssh/id_ed25519.pub
Add the public key to GitHub → Settings → SSH and GPG keys.

3. Docker Setup
Install & test Docker:

bash
Copy
Edit
sudo apt install docker.io
sudo systemctl enable --now docker
sudo usermod -aG docker $USER
Logout/login, then run:

bash
Copy
Edit
docker run hello-world

5. First CLI Programs
Node.js:

javascript
Copy
Edit
#!/usr/bin/env node
console.log("Hello, Jerathel – Welcome to ChatGPT University!")
Run:

bash
Copy
Edit
chmod +x hello-cli.js
./hello-cli.js
Go:

go
Copy
Edit
package main
import "fmt"

func main() {
    fmt.Println("Hello, Jerathel – Welcome to ChatGPT University!")
}
Run:

bash
Copy
Edit
go run hello-cli.go
🛠 Lab Assignment
Repo: dev-setup
Files:

setup.md → document your installation steps with commands + screenshots

hello-cli.js (Node.js version)

hello-cli.go or hello-cli.rs (Rust version)

Push to GitHub:

bash
Copy
Edit
git add .
git commit -m "Day 1 – Dev environment setup complete"
git push origin main

