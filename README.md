# ansible-lemp-auto-backup
Configure LEMP Stack + daily Dropbox backup for the DB schemas
## LEMP Stack
- (L) Linux - Supports RHEL 8 and 9 (CentOS, Rocky, Alma)
- (E) NGINX  - Latest version in AppStream repo. Configured to PHP-FPM over socket
- (M) MariaDB - Latest version in AppStream repo. Secure installation
- (P) PHP - 8.1 from Remi repo. PHP + FPM + Opcache
## Auto backup
- Dropbox CLI installation
- Daily crontab dumps the database into the synced Dropbox directory
- Deletes dumps older than 30 days (can be personalized) to avoid the Dropbox account to reach its limit
- Steps to activate Dropbox on CLI
    - After playbook execution:
        - Run `systemctl status dropbox`
        - In the logs showed will have a Dropbox link
        - Access the link into a browser
        - Authorize Dropbox use in the device
## Configurations

`./vars/all.yml`

## Playbook usage
Copy and paste the commands of the file `./initial_setup.sh` into the console
## Playbook usage in WSL2
First create the Rocky Linux 9 distribution with the Powershell script:

    ./environment-wsl/import_rocky_linux_9_to_wsl.ps1

Then, copy and paste the commands of the file `./initial_setup.sh` into the distribution console
* Requirements: WSL2 (Microsoft Store version - Windows 10[KB5020030] or Windows 11[KB5019157]). Only since those versions the WSL allow systemd to be enabled.
## Test

Access http://localhost or the equivalent DNS of the machine, you should see the phpinfo page