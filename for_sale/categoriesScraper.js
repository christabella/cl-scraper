var Xray = require('x-ray');
var x = Xray();

x('http://singapore.craigslist.com.sg/', '.cats li', [{
    category: 'span.txt',
    link: x('a@href'), 
    // link: x(' a@href', 'selector'), // maybe follow link to see when most recent posting was?
}])
.write('categories.json');
