local function getOS()
	if jit then
		return jit.os
	end

	local fh,err = assert(io.popen("uname -o 2>/dev/null","r"))
	if fh then
		osname = fh:read()
	end

	return osname or "Windows"
end

local os = getOS()

if os =="Windows" then
    backend=require "Tolk"
    backend.trySAPI(true)
elseif os=="Darwin" or os=="OSX" then
    backend=require "macspeech"
else
    assert(false, "NO BACKEND LOADED")
end
print(backend)

local function say(text, interrupt)
    interrupt=interrupt or false
    if os=="Windows" then
        backend.output(text, interrupt)
    else
        backend.output(text)
    end

end

local function isSpeaking()
    return backend.isSpeaking()
end

return {say=say, isSpeaking=isSpeaking}



