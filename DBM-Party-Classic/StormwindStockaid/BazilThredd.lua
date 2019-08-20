local mod	= DBM:NewMod("BazilThredd", "DBM-Party-Classic", 15)
local L		= mod:GetLocalizedStrings()

mod:SetRevision("20190614210311")
mod:SetCreatureID(1716)

mod:RegisterCombat("combat")

mod:RegisterEventsInCombat(
	"SPELL_CAST_SUCCESS 7964"
)

local warningSmokeBomb			= mod:NewSpellAnnounce(7964, 2)

local timerSmokeBombCD			= mod:NewAITimer(180, 7964, nil, nil, nil, 3)

function mod:OnCombatStart(delay)
	timerSmokeBombCD:Start(1-delay)
end

function mod:SPELL_CAST_SUCCESS(args)
	if args.spellId == 7964 then
		warningSmokeBomb:Show()
		timerSmokeBombCD:Start()
	end
end
