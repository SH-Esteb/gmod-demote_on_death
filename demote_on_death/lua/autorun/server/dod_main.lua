local function DarkRPDemoteOnDeath(victim, inflictor, attacker)
	if GetConVar("dod_darkrpcheck"):GetBool() && engine.ActiveGamemode() == "darkrp" then
		if GetConVar("dod_enable"):GetBool() then
			if !GetConVar("dod_adminbypass"):GetBool() and !victim:IsAdmin() then
				if victim == attacker then
					if GetConVar("dod_suicide"):GetBool()
						victim:teamBan()
						victim:changeTeam(GAMEMODE.DefaultTeam, true)
					end
				else
					victim:teamBan()
					victim:changeTeam(GAMEMODE.DefaultTeam, true)
				end
			end
		end
	end
end
hook.Add("PlayerDeath", "DarkRP Demote on Death", DarkRPDemoteOnDeath)

local function DarkRPDemoteOnSilentDeath(victim, inflictor, attacker)
	if GetConVar("dod_silent"):GetBool() then
		DarkRPDemoteOnDeath(victim, inflictor, attacker) -- use less code :P
	end
end
hook.Add("PlayerSilentDeath", "DarkRP Demote on Silent Death", DarkRPDemoteOnSilentDeath)
