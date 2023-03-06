 ## GENERATE WSX
docker run --rm -v ${pwd}:/wix  dactiv/wix heat dir ./source-files -gg -t .\transform.xslt -cg "FILES" -sfrag -dr "SOURCEFILES" -srd  -o files.wsx

## GENERATE WIXOBJ
docker run --rm -v ${pwd}:/wix  dactiv/wix candle .\files.wsx
docker run --rm -v ${pwd}:/wix  dactiv/wix candle .\installer.wsx

## GENERATE MSI
docker run --rm -v ${pwd}:/wix  dactiv/wix light -spdb -sval .\*.wixobj -b "./source-files" -o installer.msi