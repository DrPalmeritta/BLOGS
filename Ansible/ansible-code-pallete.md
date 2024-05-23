${{\color{orange}\Huge{\textsf{ Code pallete: }}}}\$

${{\color{MidnightBlue}\large{\textsf{ tasks: }}}}\$

<details>
	<summary>
	Examples for multi-page tasks/main.yml file
	</summary>
	<br />

First one:

	- include: example_vol1.yml
	- include: example_vol2.yml
	  when: var_example_vol1 == "foo"

Another one:

	- name: Run example_vol1.yml
	  ansible.builtin.include_tasks: example_vol1.yml

	- name: Run exanple_vol2.yml
	  ansible.builtin.include_tasks: example_vol2.yml
	  when:
	    - var_example_vol1 == "foo"

	- name: Run example_vol3.yml
	  ansible.builtin.include_tasks: example_vol3.yml
	  when:
	    - var_example_vol1 == "bar"
	    - var_example_vol2 | bool

</details>

${{\color{MidnightBlue}\large{\textsf{ roles: }}}}\$

`To be continued...`

${{\color{MidnightBlue}\large{\textsf{ inventories: }}}}\$

`To be continued...`
