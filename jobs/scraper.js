var Promise        = require('bluebird')
,   fs             = require('fs')
,   Xray           = require("x-ray")
,   xray           = new Xray().delay('5s', '30s')
,   scrapedData    = {}
,   categories = require('./categoriesByEmployment.json');

categories.forEach(function(category) {
  var cat = category.category.replace(/ \/ /g,", "); 


  var rStream = xray(category.link, 'p.row', [{
      title: 'a.hdrlnk',
      price: 'span.price',
      href: 'span.txt>span.pl>a@href',
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
          console.log('Error reading from '+url+' : ', err);
        }
    })
    .paginate('a.button.next@href')
    .write("jobs/Shanghai/" + cat + ".json");
  });