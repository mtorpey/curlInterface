#
# curlInterface: Simple Web Access
#
# Implementations
#
InstallGlobalFunction("CurlRequest",
function(URL, type, out_string, opt...)
    local verifyCert;
    if Length(opt) = 1 then
        verifyCert := opt[1];
        if verifyCert <> true and verifyCert <> false then
            ErrorNoReturn("CurlRequest: <verifyCert> must be true or false");
        fi;
    elif Length(opt) = 0 then
        verifyCert := true;
    else
        ErrorNoReturn("CurlRequest: usage: requires 3 or 4 arguments, but ",
                      Length(opt) + 3, " were given");
    fi;
    if not IsString(URL) then
        ErrorNoReturn("CurlRequest: <URL> must be a string");
    elif not IsString(type) then
        ErrorNoReturn("CurlRequest: <type> must be a string");
    elif not IsString(out_string) then
        ErrorNoReturn("CurlRequest: <out_string> must be a string");
    fi;
    return CURL_REQUEST(URL, type, out_string, verifyCert);
end);

InstallGlobalFunction( "DownloadURL",
function(URL, opt...)
    return CallFuncList(CurlRequest, Concatenation([URL, "GET", ""], opt));
end);

InstallGlobalFunction( "PostToURL",
function(URL, str, opt...)
    return CallFuncList(CurlRequest, Concatenation([URL, "POST", str], opt));
end);
