 ## GENERATE WSX
docker run --rm -v ${pwd}:/wix  dactiv/wix heat dir ./source-files -gg -t .\transform.xslt -cg "FILES" -sfrag -dr "SOURCEFILES" -srd  -o teste.wsx

## GENERATE WIXOBJ
docker run --rm -v ${pwd}:/wix  dactiv/wix candle .\teste.wsx
docker run --rm -v ${pwd}:/wix  dactiv/wix candle .\output.wsx

## GENERATE MSI
docker run --rm -v ${pwd}:/wix  dactiv/wix light -spdb -sval .\*.wixobj -b "./source-files" -o installer.msi