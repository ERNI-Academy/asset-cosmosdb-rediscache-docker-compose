curl --retry 10 --connect-timeout 5 --max-time 10 --retry-delay 5 --retry-max-time 40 --retry-connrefused --retry-all-errors -k https://localhost:8081/_explorer/emulator.pem > CosmosDBEmulatorCert.crt
Import-Certificate -FilePath .\emulatorcert.crt -CertStoreLocation Cert:\LocalMachine\Root
