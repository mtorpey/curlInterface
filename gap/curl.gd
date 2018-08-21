#
# curlInterface: Simple Web Access
#
#! @Chapter Overview
#! 
#! CurlInterface allows a user to interact with http and https 
#! servers on the internet, using the `curl' library.
#! Pages can be downloaded from a URL, and http POST requests
#! can be sent to the URL for processing.

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
#! curlInterface currently provides the following functions for interacting with
#! URLs:

#! @Arguments URL[, verifyCert]
#! @Returns
#!   a record
#! @Description
#!   Download a URL from the internet. Accepts a web address as a string, which
#!   can start with either "http://" or "https://".  Setting the optional
#!   argument <A>verifyCert</A> to <K>false</K> disables verification of HTTPS
#!   certificates.  <A>verifyCert</A> defaults to <K>true</K>.
#!
#!   Returns a record describing the result. This record will always contain the
#!   component <C>success</C>, which is a boolean describing whether the
#!   download was successful.  If <C>success</C> is <K>true</K>, then the
#!   downloaded information is stored in the component <C>result</C>; otherwise,
#!   <C>error</C> will contain a human-readable error string.
DeclareGlobalFunction( "DownloadURL" );

#! @Arguments URL, str[, verifyCert]
#! @Returns
#!   a record
#! @Description
#!   Send an HTTP POST request to a URL on the internet. The argument <A>URL</A>
#!   should be a string describing an address, and should start with either
#!   "http://" or "https://". The argument <A>str</A> should be a string which
#!   will be sent to the server as a POST request.  Setting the optional
#!   argument <A>verifyCert</A> to <K>false</K> disables verification of HTTPS
#!   certificates.  <A>verifyCert</A> defaults to <K>true</K>.
#!
#!   Returns a record describing the result. This record will always contain the
#!   component <C>success</C>, which is a boolean describing whether the
#!   download was successful.  If <C>success</C> is <K>true</K>, then the
#!   downloaded information is stored in the component <C>result</C>; otherwise,
#!   <C>error</C> will contain a human-readable error string.
DeclareGlobalFunction( "PostToURL" );

#! @Arguments URL, type, out_string[, verifyCert]
#! @Returns
#!   a record
#! @Description
#!   Send an HTTP request of type <A>type</A> to a URL on the internet.
#!   <A>URL</A>, <A>type</A>, and <A>out_string</A> should all be strings:
#!   <A>URL</A> is the URL of the server, <A>type</A> is the type of HTTP
#!   request (e.g. "GET"), and <A>out_string</A> is the message, if any, to send
#!   to the server (in requests such as GET this will be ignored).  Finally,
#!   <A>verifyCert</A> should be a boolean describing whether HTTPS certificates
#!   should be verified (optional, with a default value of <K>true</K>).
#!   Currently only GET and POST requests are supported.  For convenience, GET
#!   requests can be called with <Ref Func="DownloadURL"/> and POST requests can
#!   be called with <Ref Func="PostToURL"/>.
#!
#!   Returns a record describing the result. This record will always contain the
#!   component <C>success</C>, which is a boolean describing whether the
#!   download was successful.  If <C>success</C> is <K>true</K>, then the
#!   downloaded information is stored in the component <C>result</C>; otherwise,
#!   <C>error</C> will contain a human-readable error string.
DeclareGlobalFunction( "CurlRequest" );
