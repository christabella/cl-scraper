var Promise        = require('bluebird')
,   fs             = require('fs')
,   Xray           = require("x-ray")
,   xray           = new Xray()
,   scrapedData    = {}
,   categories = require('./categories.json');

Promise.map(categories, function(catObj){
    return [catObj, xray(catObj.link, 'p.row', [{
      title: 'span#titletextonly',
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
    // .paginate('a.button.next@href')
    // .delay(1000, 10000) // delay next request from 1 to 10 seconds
    .stream()];
})
.each(function(catObjAndStream){
    return new Promise(function(resolve, reject){
        var data = '';
        var catObj  = catObjAndStream[0];
        var stream = catObjAndStream[1];
        stream.on('data', function(chunk) {
            data += chunk;
        })

        stream.on('end', function() {
            scrapedData[catObj.category] = JSON.parse(data); 
            resolve(catObj);
        });
    });
})
.then(function() {
    jsonOutput = JSON.stringify(scrapedData, null, 2);
    // jsonOutput = jsonOutput.replace(/"([^(")"]+)":/g,"$1:"); // strip double quotes from JSON properties
    // jsonOutput = jsonOutput.replace(/valid until /g,""); // strip "valid until " from valid_until fields; but very slow
    fs.writeFile("data.json", jsonOutput, function(err) {
        if(err) {
            return console.log(err);
        }

        console.log("Scraped data written to data.json.");
    }); 
})










// function retrievePosts(){
//   var contents = fs.readFileSync('listings.json');
//   var links = JSON.parse(contents);
//   var results = [];
//   var counter = 0;
//   links.forEach(function(item){
//     var url = item.href;
//     xray(url, 'div.mapAndAttrs',
//       {
//         make: 'div.mapbox + p.attrgroup>span>b',
//         details: ['p.attrgroup + p.attrgroup>span']
//       })(function(err, result){
//         if(err) {
//           console.log('Error reading from '+url+' : ', err);
//         }
//         var formatted = {};
//         formatted.CLpost = item.title;
//         if(result.make){
//           formatted.make = result.make;
//         }
//         result.details.forEach(function(item){
//           var info = item.split(': ');
//           formatted[info[0]] = info[1];
//         })
//         results.push(formatted);
//         counter++;
//         if(counter === links.length){
//           fs.writeFile('posts.json', JSON.stringify(results));
//         }
//       })
//   });
// };