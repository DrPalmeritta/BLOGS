${{\color{orange}\Huge{\textsf{ Useful prompts: }}}}\$

${{\color{MidnightBlue}\large{\textsf{ cli main: }}}}\$

`kcadm.sh get realms --server http://localhost:8080/` - list all realms

`kcadm.sh config credentials --server http://localhost:8080/ --realm demo --user admin --client admin` - set credentials for $master realm

`kcadm.sh config credentials --config /PATH/TO/HOMEDIR/keycloak/.keycloak/kcadm.config --server http://localhost:8080 --realm master --user admin` - generate config file for keycloak service

`kcadm.sh create realms -s realm=demorealm -s enabled=true -o` - create realm

${{\color{MidnightBlue}\large{\textsf{ http source prompts: }}}}\$

`GET localhost:8080/realms` - json output for all realms

`GET localhost:8080/realms/demo` - json output for specified realm

`GET localhost:8080/realms/demo/clients` - json output for all clients in specified realm

`GET localhost:8080/realms/demo/clients/[client_name]` - json output for specified client
