# whisperstt

This is a go program that captures input from your microphone until you press ESC and uses the "Open"AI API to call Whisper and prints to stdout the return text from the api

Only tested on Linux (Wayland). I highly doubt it works on anything else 


Required environment variables: 
`OPENAI_API_KEY` (yes, I know this shouldn't live in an env var. I'll happily accept a PR to fix this)
