FROM dactiv/wix

COPY ./source-files /wix/source-files
COPY ./script/generate-installer.sh /wix
COPY ./config/installer.conf /wix
COPY ./config/installer.wsx /wix
COPY ./config/transform.xslt /wix
COPY banner.txt /wix

WORKDIR /wix

ENTRYPOINT [ "sh", "script/generate-installer.sh" ]