var Xray = require('x-ray');
var x = Xray();

x('http://colombia.craigslist.org/?lang=en&cc=us', 'ul.acitem li', [{
    country: 'a',
    link: 'a@href', 
    // link: x(' a@href', 'selector'), // maybe follow link to see when most recent posting was?
}])
.write('countries.json');
