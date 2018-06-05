#
# curlInterface: Simple Web Access
#
#! @Chapter Overview
#! 
#! CurlInterface provides functionality which allows URLs to be 
#! downloaded from the internet.


#! @Section Functions
#!
#! At present, curlInterface provides a single function:

#! @Arguments URL[, verifyCert]
#! @Description
#!  Download a URL from the internet. Accepts a web address
#!  as a string, which can start with either of http:// or https://
#!  Setting the optional argument <A>verifyCert</A> to <K>false</K>
#!  disables verification of HTTPS certificates.
#!  <A>verifyCert</A> defaults to <K>true</K>.
#!
#! @Returns A record describing the result. This record will always
#!  contain the component 'success', which is a boolean describing
#!  if the download was successful.
#!  If 'success' is <K>true</K>, then the downloaded files is stored
#!  in the component 'result'. If 'success' is <K>false</K>, then
#!  'error' will contain a human-readable error string.
DeclareGlobalFunction( "DownloadURL" );
