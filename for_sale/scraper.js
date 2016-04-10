var Promise        = require('bluebird')
,   fs             = require('fs')
,   Xray           = require("x-ray")
,   xray           = new Xray().delay('2s', '5s')
,   scrapedData    = {}
,   country = process.env.COUNTRY
,   countryLink = process.env.LINK;

var categories = [
  {
    "category": "by owner",
    "link": countryLink + "search/sso"
  },
  {
    "category": "by dealer",
    "link": countryLink + "search/ssq"
  }
];

categories.forEach(function(cat) {
  console.log("xraying " + cat.link);
  var rStream = xray(cat.link, 'p.row', [{
      title: 'a.hdrlnk',
      price: 'span.price',
      time: 'time@datetime',
      location: 'span.l2 small',
      picture_present: 'span.p',
      link: '.pl a@href',
        // image: xray('a@href', [{title: 'title'}])
        // image: function($, cb2) {
        //   return x($(this), 'title', [{
        //     name: ''
        //   }])(cb2);
        // }
    }])
    (function(err, result){
        if (err) {
          console.log('Error reading from ' + cat.link + ' : ', err);
        }
    })
    .paginate('a.button.next@href')
    .write("for_sale/"+ country + "/" + cat.category + ".json");
  });