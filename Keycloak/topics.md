${{\color{orange}\Huge{\textsf{ Topics data: }}}}\$

<details>
	<summary>
	Import new realm & setup environment with CLI
	</summary>
	<br />

Authentificate to keycloak service via cli:
`kcadm.sh config credentials --server http://localhost:8000/ --realm [REALM_NAME] --user [USERNAME]`

Import the realm source file:
`kcadm.sh create realms -f /PATH/TO/YOUR/REALM.json -s enabled=true`

Create the user for imported realm:
`kcadm.sh create users -r [REALM_NAME] -s username=[USERNAME] -s enabled=true`

Update the user role profile if necessary(there is no msitake in `uusername` env):
`kcadm.sh add-roles --uusername [USERNAME] --rolename [ROLENAME] -r [REALM_NAME]`

Setup the password for new user:
`kcadm.sh set-password -r [REALM_NAME] --username [USERNAME] --new-password [VERY_STRONG_PASSWORD]`
  
</details>
