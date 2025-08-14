var wiredep = require('wiredep').stream;
var vfs = require('vinyl-fs');

vfs.src('./index.html')
    .pipe(wiredep())
    .pipe(vfs.dest('./', {
        overwrite: true
    }));
