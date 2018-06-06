#
# curlInterface: Simple Web Access
#
#! @Chapter Overview
#! 
#! CurlInterface allows http and https URLs to be downloaded from
#! the internet, using the 'curl' library.

#! @Section Installing curlInterface
#!
#! curlInterface requires the 'curl' library, available from
#! <URL>https://curl.haxx.se/</URL>. Instructions for building
#! and installing curl can be found at
#! <URL>https://curl.haxx.se/docs/install.html</URL>, however
#! in most systems curl can be installed from your OS's package
#! manager.
#!
#! @Subsection Linux
#!
#! <List>
#! <Item>
#! On Debian and Ubuntu, call: <C>apt-get install libcurl4-gnutls-dev</C></Item>
#! <Item>
#! On Redhat and derivatives, call: <C>yum install curl-devel</C></Item>
#! </List>
#!
#! @Subsection Cygwin
#!
#! Install <C>libcurl-devel</C> from the cygwin package manager
#!
#! @Subsection Mac OS X
#!
#! curl is installed by default on Macs.
#! <List>
#! <Item>Homebrew: <C>brew install TODO-I-DON'T-KNOW</C></Item>
#! <Item>Fink: <C>fink install libcurl4</C></Item>
#! <Item>MacPorts: <C>port install curl</C></Item>
#! </List>

#! @Section Functions
#!
#! curlInterface currently provides a single function:

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
