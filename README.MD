 ## Docker build
 
```
docker build -t generate-msi -f ./ .
```


## Run
```
docker run --rm -v ${pwd}:/wix  generate-msi
```


### REGISTRY

HKEY_CURRENT_USER\System\CurrentControlSet\Policies

ENVIRONMENT = P OR H
