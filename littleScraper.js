var Xray = require('x-ray');
var x = Xray();

x("http://singapore.craigslist.com.sg/search/jjj?s=300", 'p.row', [{
    name: 'a.hdrlnk',
    link: x('a@href'), 
    // link: x(' a@href', 'selector'), // maybe follow link to see when most recent posting was?
}])
(function(err, obj) {
    console.log(obj);
})