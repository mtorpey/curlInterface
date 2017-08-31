gap> LoadPackage("curl", false);
true

# Check HTTP
gap> r := DownloadURL("http://www.google.com");;
gap> SortedList(RecNames(r));
[ "result", "success" ]
gap> r.success;
true
gap> IsMatchingSublist(r.result, "google");
false
gap> IsMatchingSublist("google", r.result);
false

# Sanity check the result without actually printing it
gap>  PositionSublist(r.result, "google") <> fail;
true
gap> r.result{[1..6]};
"<HTML>"

# Check HTTPS
gap> r := DownloadURL("https://www.google.com");;
gap> SortedList(RecNames(r));
[ "result", "success" ]
gap> r.success;
true
gap> IsMatchingSublist(r.result, "google");
false
gap> IsMatchingSublist("google", r.result);
false

# Sanity check the result without actually printing it
gap>  PositionSublist(r.result, "google") <> fail;
true
gap> r.result{[1..6]};
"<HTML>"

# Check FTP
gap> r := DownloadURL("ftp://speedtest.tele2.net/1KB.zip");;
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
gap> r.error;
"Could not resolve host: www.google.cheesebadger"
