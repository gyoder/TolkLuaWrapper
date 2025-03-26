tts=require "tts"
print("synthesizer about to speak, currently " ..tostring(tts.isSpeaking()) ..".")
tts.say("Hello world!")
if tts.isSpeaking()==true then print("It's talking!") end

while true do

end
