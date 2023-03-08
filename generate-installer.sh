source installer.conf

cat banner.txt

rm files.wsx -r -f
rm *.wixobj -r -f

echo "Iniciando geração de instalador"
heat dir ${sourcePath} -gg -t transform.xslt -cg "FILES" -sfrag -dr "SOURCEFILES" -srd -o files.wsx
candle files.wsx
candle installer.wsx -dInstallerName=${installerName} -dInstallerVersion=${installerVersion} -dTargetPath=${targetPath}

light -spdb -sval ./*.wixobj -b ${sourcePath} -o ${installerName}-${installerVersion}.msi
echo "************ Instalador gerado com sucesso ${installerName}-${installerVersion}.msi ************" 

rm files.wsx -r -f
rm *.wixobj -r -f