# Magento2 Clean

###Here you can find the hosts and credentials for this project: [Magento2 Credentials](CREDS.md)

## Requirements

* Docker
* Copy `server.crt` from local-ssl folder to `Keychain Access` and Trust the certificate.
![](ssl.gif)

## Run the project

Just run and follow the instructions:
```
./run.sh 
```

If you make changes in the Docker files, please run as: `./run.sh --build`

## Development

1. In order to develop new functions on Magento2, you can create modules in `magento/app/code` which is mapped to `/var/www/html/app/code` inside of the container. Logs an errors can be found in `magento/var` which is mapped to `/var/www/html/var/` in the container.
2. Run `./exec.sh` to ssh into the php container, where you can run `php bin/magento` or `composer` commands.

## Reset the project

By running `./clear-project.sh` you're able to clean and reset the entire project. This process will remove db data and the Docker Image, but it will not remove the files from `magento/app/code` or `magento/var/`

# Troubleshooting

2. To uninstall magento2.local certificate (crt file), search on `Keychain Access` for `magento2` and remove it.
