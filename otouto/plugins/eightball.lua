--[[
    eightball.lua
    Returns magic 8-ball-like answers.

    Copyright 2016 topkecleon <drew@otou.to>
    This code is licensed under the GNU AGPLv3. See /LICENSE for details.
]]--

local utilities = require('otouto.utilities')

local eightball = {}

function eightball:init()
    eightball.command = '8ball'
    eightball.doc = 'Returns an answer from a magic 8-ball!'
    eightball.triggers = utilities.triggers(self.info.username, self.config.cmd_pat,
        {'[Yy]/[Nn]%p*$'}):t('8ball', true).table
end

local ball_answers = {
    "It is certain.",
    "It is decidedly so.",
    "Without a doubt.",
    "Yes, definitely.",
    "You may rely on it.",
    "As I see it, yes.",
    "Most likely.",
    "Outlook: good.",
    "Yes.",
    "Signs point to yes.",
    "Reply hazy try again.",
    "Ask again later.",
    "Better not tell you now.",
    "Cannot predict now.",
    "Concentrate and ask again.",
    "Don't count on it.",
    "My reply is no.",
    "My sources say no.",
    "Outlook: not so good.",
    "Very doubtful.",
    "There is a time and place for everything, but not now."
}

local yesno_answers = {
    'Absolutely.',
    'In your dreams.',
    'Yes.',
    'No.'
}

function eightball:action(msg)
    local output
    if msg.text_lower:match('y/n%p?$') then
        output = yesno_answers[math.random(#yesno_answers)]
    else
        output = ball_answers[math.random(#ball_answers)]
    end
    utilities.send_reply(msg, output)
end

return eightball
