#!/bin/bash
#export certname ${1}
#echo $certname
echo "Create cert is invoked!"
echo ${1}

openssl pkcs12 -in ${1}.pfx -passin pass:${2} -nokeys -clcerts | awk '/BEGIN CERTIFICATE/,/END CERTIFICATE/' > ${1}-cert.pem

openssl pkcs12 -in ${1}.pfx -passin pass:${2} -nodes | awk '/BEGIN PRIVATE KEY/,/END PRIVATE KEY/' > ${1}-key.pem

openssl pkcs12 -in ${1}.pfx -passin pass:${2} -nokeys -cacerts | awk '/BEGIN CERTIFICATE/,/END CERTIFICATE/' > ${1}-chain.pem

echo "Create cert is complete!"