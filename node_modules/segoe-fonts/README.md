# Segoe Fonts

Easily import and setup the Segoe font family.

## Installation

### Bower
~~~~
bower install segoe-fonts --save
~~~~

### NPM / Webpack
~~~
npm install segoe-fonts -S
~~~

See example webpack config in test/webpack :metal:

## Usage
#### Less Font Stack
```css
@segoe: 'Segoe UI', 'Open Sans', Helvetica, sans-serif;
@segoe-semibold: 'Segoe UI Semibold', 'Open Sans', Helvetica, sans-serif;
@segoe-bold: 'Segoe UI Bold', 'Open Sans', Helvetica, sans-serif;
@segoe-light: 'Segoe UI Light', 'Open Sans', Helvetica, sans-serif;
```

#### Sass Font Stack
```scss
$segoe: 'Segoe UI', 'Open Sans', Helvetica, sans-serif;
$segoe-semibold: 'Segoe UI Semibold', 'Open Sans', Helvetica, sans-serif;
$segoe-bold: 'Segoe UI Bold', 'Open Sans', Helvetica, sans-serif;
$segoe-light: 'Segoe UI Light', 'Open Sans', Helvetica, sans-serif;
```

## Contributing

#### Running bower tests
In ./test/bower:
~~~
npm install
~~~

```bash
npm run install     # Uninstalls segoe-fonts (if exists); clears the bower cache and installs segoe fonts from dev.
npm test            # Wires in segoe-fonts on the index page and opens it up locally.
```

#### Running webpack bundling tests
In ./test/webpack
~~~
npm install
npm test
~~~
