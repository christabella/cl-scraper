var Promise        = require('bluebird')
,   fs             = require('fs')
,   Xray           = require("x-ray")
,   xray           = new Xray().delay('5s', '30s')
,   scrapedData    = {}
,   country = process.env.COUNTRY
,   countryLink = process.env.LINK;

categories = [
  {
    "category": "by owner",
    "link": countryLink + "/search/sso"
  },
  {
    "category": "by dealer",
    "link": countryLink + "/search/ssq"
  }
]


categories.forEach(function(category) {
  var cat = category.category.replace(/ \/ /g,", "); 


  var rStream = xray(category.link, 'p.row', [{
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
        if(err) {
          console.log('Error reading from ' + category.link + ' : ', err);
        }
    })
    .paginate('a.button.next@href')
    .write("for_sale/"+ country + "/" + cat + ".json");
  });