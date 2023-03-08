FROM dactiv/wix

COPY ./source-files /wix/source-files
COPY generate-installer.sh /wix
COPY installer.conf /wix
COPY installer.wsx /wix
COPY transform.xslt /wix
COPY banner.txt /wix

WORKDIR /wix


ENTRYPOINT [ "sh", "generate-installer.sh" ]