#
# curlInterface: Simple Web Access
#
# Implementations
#
InstallGlobalFunction( "DownloadURL",
function(URL)
    local ret;
    ret := CURL_READ_URL(URL);
    if ret[1] = false then
        return rec(success := false, error := ret[2]);
    else
        return rec(success := true, result := ret[2]);
    fi;
end);


InstallGlobalFunction( "URLVerification",
function(verify)
    CURL_HTTPS_VERIFICATION(verify);
end);
