local mod	= DBM:NewMod("Glutton", "DBM-Party-Classic", 10)
local L		= mod:GetLocalizedStrings()

mod:SetRevision("20190614210311")
mod:SetCreatureID(8567)
--mod:SetEncounterID(585)

mod:RegisterCombat("combat")

mod:RegisterEventsInCombat(
	"SPELL_CAST_SUCCESS 12795"
)

--TODO, add Disease Cloud when data is known
local warningEnrage					= mod:NewSpellAnnounce(12795, 2)

--[[
function mod:OnCombatStart(delay)

end
--]]

function mod:SPELL_CAST_SUCCESS(args)
	if args.spellId == 12795 then
		warningEnrage:Show()
	end
end
