gap> LoadPackage("curlInterface", false);
true

# Check HTTP
gap> r := DownloadURL("http://www.google.com");;
gap> SortedList(RecNames(r));
[ "result", "success" ]
gap> r.success;
true
gap> PositionSublist(r.result, "google") <> fail;
true
gap> PositionSublist("google", r.result) <> fail;
false

# Sanity check the result without actually printing it
gap>  PositionSublist(r.result, "google") <> fail;
true
gap> r.result[1];
'<'

# Check HTTPS
gap> r := DownloadURL("https://www.google.com");;
gap> SortedList(RecNames(r));
[ "result", "success" ]
gap> r.success;
true
gap> PositionSublist(r.result, "google") <> fail;
true
gap> PositionSublist("google", r.result) <> fail;
false

# Sanity check the result without actually printing it
gap>  PositionSublist(r.result, "google") <> fail;
true
gap> r.result[1];
'<'

# Check FTP
gap> r := DownloadURL("ftp://fra36-speedtest-1.tele2.net/1KB.zip",
>                     rec(verbose := true));;
gap> SortedList(RecNames(r));
[ "result", "success" ]
gap> r.success;
true
gap> r.result = ListWithIdenticalEntries(1024, '\000');
true

# Check bad URL
gap> r := DownloadURL("https://www.google.cheesebadger");;
gap> SortedList(RecNames(r));
[ "error", "success" ]
gap> r.success;
false
gap> PositionSublist(r.error, "Could not resolve host") <> fail;
true

# Check successful POST requests
gap> r := PostToURL("httpbin.org/post", "field1=true&field2=17");;
gap> SortedList(RecNames(r));
[ "result", "success" ]
gap> r.success;
true
gap> PositionSublist(r.result, "\"field1\": \"true\"") <> fail;
true
gap> PositionSublist(r.result, "\"field2\": \"17\"") <> fail;  
true
gap> PositionSublist(r.result, "field3") <> fail;
false

# Check POST on a string with null characters
gap> r := PostToURL("httpbin.org/post", "field1=my\000first\000field");;
gap> SortedList(RecNames(r));
[ "result", "success" ]
gap> r.success;
true
gap> PositionSublist(r.result, "my\\u0000first\\u0000field") <> fail;
true
gap> PositionSublist(r.result, "field3") <> fail;
false

# Check POST method not allowed (405)
gap> r := PostToURL("www.google.com", "myfield=42");;
gap> SortedList(RecNames(r));
[ "result", "success" ]
gap> r.success;
true
gap> PositionSublist(r.result, "myfield") <> fail;
false
gap> PositionSublist(r.result, "405") <> fail;
true

# Check bad URL with POST
gap> r := PostToURL("https://www.google.cheesebadger", "hello");;
gap> SortedList(RecNames(r));
[ "error", "success" ]
gap> r.success;
false
gap> PositionSublist(r.error, "Could not resolve host") <> fail;
true

# Check not IsStringRep (url)
gap> url := List("https://www.google.com", letter -> letter);;
gap> IsStringRep(url);
false
gap> r := DownloadURL(url);;
gap> SortedList(RecNames(r));
[ "result", "success" ]
gap> r.success;
true
gap> PositionSublist(r.result, "google") <> fail;
true

# Check not IsStringRep (post_string)
gap> post_string := List("animal=tiger&material=cotton", letter -> letter);;
gap> IsStringRep(post_string);
false
gap> r := PostToURL("httpbin.org/post", post_string, rec(verifyCert := true));;
gap> r.success;
true
gap> PositionSublist(r.result, "\"animal\": \"tiger\"") <> fail;
true
gap> PositionSublist(r.result, "\"material\": \"cotton\"") <> fail;
true
gap> PositionSublist(r.result, "lion") <> fail;
false

# Check not IsStringRep (request type)
gap> r := CurlRequest("www.google.com", ['G', 'E', 'T'] , "");;
gap> r.success;
true
gap> SortedList(RecNames(r));
[ "result", "success" ]
gap> PositionSublist(r.result, "google") <> fail;
true
gap> PositionSublist(r.result, "tiger") <> fail;
false

# HEAD requests
gap> CurlRequest("www.google.com", "HEAD" , "");
rec( result := "", success := true )
gap> r := CurlRequest("www.google.cheesebadger", "HEAD" , "");;
gap> r.success;
false

# DELETE requests
gap> r := DeleteURL("https://www.google.com");;
gap> r.success;
true
gap> PositionSublist(r.result, "405") <> fail;
true
gap> PositionSublist(r.result, "tiger") <> fail;
false
gap> r := DeleteURL("www.httpbin.org/delete");;
gap> r.success;
true
gap> PositionSublist(r.result, "405") <> fail;
false

# Check verbose requests don't break anything (we can't catch the output here)
#gap> r := DownloadURL("http://www.httpbin.org/get", rec(verbose := true));;
#gap> r.success;
#true
#gap> PositionSublist(r.result, "httpbin") <> fail;
#true
#gap> PositionSublist(r.result, "404") <> fail;
#false
