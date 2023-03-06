 ## Generate WSX
 
```
docker run --rm -v ${pwd}:/wix  dactiv/wix heat dir ./source-files -gg -t .\transform.xslt -cg "FILES" -sfrag -dr "SOURCEFILES" -srd  -o files.wsx
```


## Generate WIXOBJ
```
docker run --rm -v ${pwd}:/wix  dactiv/wix candle .\files.wsx
```
```
docker run --rm -v ${pwd}:/wix  dactiv/wix candle .\installer.wsx
```

## Generate MSI
```
docker run --rm -v ${pwd}:/wix  dactiv/wix light -spdb -sval .\*.wixobj -b "./source-files" -o installer.msi
```

### REGISTRY

HKEY_CURRENT_USER\System\CurrentControlSet\Policies

ENVIRONMENT = P OR H
