 ## GENERATE WSX

docker run --rm -v ${pwd}:/wix  dactiv/wix heat dir ./source-files -gg -ke -t .\transform.xslt -cg "CGTest" -dr "DRTest" -srd  -o teste.wsx

## GENERATE WIXOBJ
docker run --rm -v ${pwd}:/wix  dactiv/wix candle .\teste.wsx
docker run --rm -v ${pwd}:/wix  dactiv/wix candle .\output.wsx

## GENERATE MSI
docker run --rm -v ${pwd}:/wix  dactiv/wix light -spdb -sval .\*.wixobj -b "./source-files" -o installer.msi




TODO

OK - Usar condition pra nao instalar determinada pasta

OK - Transform colocar condition no componente pelo nome

OK - Fazer pegar pelo registry o valor de ENVIRONMENT

Pegar somente o arquivo e jogar no path destino

Pensar na ideia de ter wsx por ENVIRONMENT ou deixar a decisão a cargo do script