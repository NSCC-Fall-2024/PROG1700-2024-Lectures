
param (
    $Name
)

function Write-Emoji {
    param (
        $emojiName
    )
    $emojis = @{
        'happyface'   = "`u{1F604}"
        'seenoevil'   = "`u{1F648}"
        'hearnoevil'  = "`u{1F649}"
        'speaknoevil' = "`u{1F64A}"
        'frosty'      = "`u{2603}"
        'tree'        = "`u{1F384}"
        'santa'       = "`u{1F385}"
        'poop'        = "`u{1F4A9}"
    }

    Write-Host $emojis[$emojiName]
}

Write-Emoji $Name