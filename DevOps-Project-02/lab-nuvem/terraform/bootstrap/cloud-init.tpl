#cloud-config
package_update: true
packages:
  - nginx
  - unzip
  - curl
runcmd:
  - [ sh, -xc, "curl -sSL '${site_url}' -o /tmp/site.zip" ]
  - [ sh, -xc, "unzip -o /tmp/site.zip -d /var/www/html" ]
  - [ sh, -xc, "chown -R www-data:www-data /var/www/html" ]
  - [ sh, -xc, "systemctl enable nginx" ]
  - [ sh, -xc, "systemctl restart nginx" ]
