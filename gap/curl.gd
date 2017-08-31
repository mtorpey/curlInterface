#
# curl: Simple Web Access
#
# Declarations
#

#! @Arguments [URL]
#! @Description
#!  Download a URL from the internet. Accepts a web address
#!  as a string, which can start with either of http:// or https://
#! @Returns A record describing the result. This record will always
#!  contain the option 'success', which will be <K>true</K> or
#!  <K>false</K>. If 'success' is <K>true</K>, then 'result' will
#!  contain the downloaded file. If 'success' is <K>false</K>, then
#!  'error' will contain a human-readable string describing the error.
DeclareGlobalFunction( "DownloadURL" );


#! @Arguments [Bool]
#! @Description
#!  Control https verification. Disabling checking (by passing
#!  <K>false</K>) disables checking of https addresses. This reduces
#!  security, but can be required for badly configured servers or clients.
DeclareGlobalFunction( "URLVerification" );
