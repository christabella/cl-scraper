# cl-scraper
Another Node.js web scraper with x-ray.

### Usage
`cd` into root directory and run `╰─➤ node for_sale/scraper.js` for now... (or `jobs/scraper.js`, or `services/scraper.js` etc.).
** Note: don't `cd` into category folder and run `node scraper.js` **

Will have to set up automation or at least some sort of persistence, with entry point `app.js`, at some point... :weary:

### TO-DO
* Probably a smarter idea to scrape by **search/jjj?employment_type=**, and then get the category from either the page itself, or extracting from the URL to the details page. That way, we can get a whole extra dimension to the data -- employment type!

### Resources
[HOW TO PREVENT GETTING BLACKLISTED WHILE SCRAPING](https://learn.scrapehero.com/how-to-prevent-getting-blacklisted-while-scraping/)
