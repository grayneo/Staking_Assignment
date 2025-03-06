# Staking_Assignment
Staking Facilities Task Assignment

## Ubuntu Server Deployment and Hardening

### Steps to Run:
1. Navigate to the `terraform/` directory and initialize Terraform:
   ```bash
   cd terraform/
   terraform init
   ```
2. Apply the Terraform script to create the VM:
   ```bash
   terraform apply -auto-approve
   ```
3. Once the VM is created, navigate to the `ansible/` directory and configure the server:
   ```bash
   cd ../ansible/
   ansible-playbook -i inventory.ini playbook.yml
   ```

### Intentions:
- **Automate Ubuntu server deployment**: Using Terraform, we ensure the creation of a consistent and repeatable server instance.
- **Network segmentation with VLAN**: The internal interface is configured to use VLAN 150, restricting communication to tagged packets only.
- **Expose only required services**: The web server (NGINX) and SSH server are set to listen only on the external interface, limiting access.
- **Secure access control**: Firewall (UFW) rules are applied to allow SSH (port 22) and HTTP (port 80) traffic only from permitted sources.
- **Restrict internal access**: The internal device at `10.200.16.100/29` is granted access only on port 9000.
- **External interface IP**: The external interface ip choise as 180.180.180.1 feel free to change it to your desire ip
- **Automated hardening**: Disabling root login, enforcing UFW firewall, and keeping the system updated using Ansible.

### Process Breakdown:
1. **Terraform Deployment**
   - Terraform provisions a new Ubuntu VM with two network interfaces.
   - External interface is assigned a public IP, while the internal interface is VLAN 150 tagged.
   - The Terraform script outputs the public IP of the VM for use in Ansible.

2. **Ansible Configuration**
   - Ansible connects to the newly created VM and updates the system.
   - Installs NGINX and OpenSSH server.
   - Configures SSH to listen only on the external interface.
   - Sets up UFW firewall rules to secure the system.
   - Restarts necessary services to apply configurations.

By automating these steps, we achieve a repeatable and secure deployment process while reducing manual errors.

180.180.180.1
