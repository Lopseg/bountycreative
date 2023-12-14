Se tu tiver dentro um ECS containers pra tu pegar as credentials da AWS tem que executar esse cara aqui

curl 169.254.170.2$AWS_CONTAINER_CREDENTIALS_RELATIVE_URI

curl $AWS_CONTAINER_CREDENTIALS_FULL_URI -H "X-aws-ec2-metadata-token: $AWS_CONTAINER_AUTHORIZATION_TOKEN"
