### MacOS UI Scale

Go through the config file, which according to pcgaming wiki on Mac is found in

```diff
~/Library/Application Support/Terraria/
```

The Windows version has a setting called `UIScale` found in the `config.json` file, you may be able to find the same setting and change it manually to something that works for you.

### Defaults:

```diff
"Zoom": 1.0,
"UIScale": 0.4888889,
"MapScale": 1.0,
```

### Changed it for:

```diff
"Zoom": 1.5,
"UIScale": 1.0,
"MapScale": 1.5,
```

Perfect!
