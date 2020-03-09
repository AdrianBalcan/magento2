#!/bin/bash
DOMAIN="magento2.local"
#create_certificate () {
#  echo "Creating SSL/TLS certificate"
#  # make docker/certs folder if one does not already exist
#  [ -d ./local-ssl ] || mkdir ./local-ssl
#  # install devcert dependency
#  cd ./devcert && yarn install && cd -
#  node ./devcert/makeHostAndCert $DOMAIN || STATUS=$?
#}
#if [[ -f "./local-ssl/server.crt" ]] && [[ -f "./local-ssl/server.key" ]]; then
#  echo "SSL found! If you have any issue with SSL, please run './regenerate-ssl.sh'."
#  sleep 1;
#else
#  create_certificate
#fi

#if [ ! -d "../vsf-zento" ]; then
#  git clone git@bitbucket.org:blugento/vsf-zento.git ../vsf-zento
#fi
#if [ ! -d "../vsf-api-zento" ]; then
#  git clone git@bitbucket.org:blugento/vsf-api-zento.git ../vsf-api-zento
#fi
#if [ ! -d "../magento-zento" ]; then
#  git clone git@github.com:zentoshop/magento-zento.git ../magento-zento
#fi

#if [ ! -f "$(which aws)" ]; then
#    curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
#    python get-pip.py
#    rm -rf get-pip.py
#    pip install awscli
#   brew install awscli
#fi

#aws_auth (){
#    source ./config/aws/config.env
#    export AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID
#    export AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY
#    export AWS_DEFAULT_REGION=$AWS_DEFAULT_REGION
#}

#AWS_RETRY=0
#until [[ "$(aws sts get-caller-identity)" == *"682547640436"* ]]; do
#  if [ -f ./config/aws/config.env ]; then
#    aws_auth
#    if [ $AWS_RETRY > 2 ]; then
#      rm -rf ./config/aws/config.env
#      AWS_RETRY=0
#    fi
#  else
#    read -p 'AWS Access Key ID: ' AWS_ACCESS_KEY_ID
#    read -p 'AWS Secret Access Key: ' AWS_SECRET
#    SED_AWS_SECRET=$(echo $AWS_SECRET | sed -e 's/\\/\\\\/g; s/\//\\\//g; s/&/\\\&/g')
#    sed -e "s/#AWS_SECRET#/$SED_AWS_SECRET/g" -e "s/#AWS_ACCESS_KEY_ID#/$AWS_ACCESS_KEY_ID/g" < ./config/aws/config.env.sample > ./config/aws/config.env
#    aws_auth
#  fi
#  ((AWS_RETRY=$AWS_RETRY+1))
#done

#$(aws ecr get-login --no-include-email --region eu-west-1)
#docker image pull 682547640436.dkr.ecr.eu-west-1.amazonaws.com/zento/magento-base:20
#exit 0
docker-compose up $@
