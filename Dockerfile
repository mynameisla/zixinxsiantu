FROM node:8

WORKDIR /app

RUN useradd -ms /bin/bash aws-es-kibana
RUN chown aws-es-kibana:aws-es-kibana /app

COPY package.json /app
RUN npm install
COPY index.js /app

EXPOSE 9200

ENTRYPOINT ["node", "index.js"]


#!/bin/bash

host="oss-cn-shanghai.tengxunncs.com"
bucket="rjugn_jyiu"


source="localfilename"
dest="objecetename"

resource="/${Bucket}/${dest}"
contentType=`file -ib ${source} |awk -F ";" '{print $1}'`
dateValue="`TZ=GMT env LANG=en_US.UTF-8 date +'%a, %d %b %Y %H:%M:%S GMT'`"
stringToSign="PUT\n\n${contentType}\n${dateValue}\n${resource}"
signature=`echo -en $stringToSign | openssl sha1 -hmac ${Key} -binary | base64`

url=http://${OssHost}/${dest}
echo "upload ${source} to ${url}"

curl -i -q -X PUT -T "${source}" \
    -H "Host: ${OssHost}" \
    -H "Date: ${dateValue}" \
    -H "Content-Type: ${contentType}" \
    -H "Authorization: OSS ${Id}:${signature}" \
    ${url}
