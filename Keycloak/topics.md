${{\color{orange}\Huge{\textsf{ Topics data: }}}}\$

<details>
	<summary>
	Import new realm & setup environment with CLI
	</summary>
	<br />

Authentificate to keycloak service via cli:<br />
`kcadm.sh config credentials --server http://localhost:8000/ --realm [REALM_NAME] --user [USERNAME]`

Import the realm source file:<br />
`kcadm.sh create realms -f /PATH/TO/YOUR/REALM.json -s enabled=true`

Create the user for imported realm:<br />
`kcadm.sh create users -r [REALM_NAME] -s username=[USERNAME] -s enabled=true`

Update the user role profile if necessary(there is no msitake in `uusername` env):<br />
`kcadm.sh add-roles --uusername [USERNAME] --rolename [ROLENAME] -r [REALM_NAME]`

Setup the password for new user:<br />
`kcadm.sh set-password -r [REALM_NAME] --username [USERNAME] --new-password [VERY_STRONG_PASSWORD]`
  
</details>

<br>
<br>

${{\color{orange}\Huge{\textsf{ Library: }}}}\$

