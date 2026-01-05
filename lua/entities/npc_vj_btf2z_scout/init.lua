include("entities/npc_vj_btf2z_soldier/init.lua")
AddCSLuaFile("shared.lua")
include('shared.lua')
--------------------
ENT.Model = {
	"models/zombies/boneless/hwm/scout.mdl",
	"models/lazy_zombies_v1/scout.mdl"
}
ENT.StartHealth = 125
ENT.ControllerParams = {
	ThirdP_Offset = Vector(20, 0, -30),
	FirstP_Bone = "bip_head",
	FirstP_Offset = Vector(0, 0, 0), 
	FirstP_ShrinkBone = true,
}
--------------------
ENT.MeleeAttackDamage = 15
ENT.MeleeAttackDamageType = DMG_CLUB
ENT.AnimTbl_MeleeAttack = "vjges_melee_swing"
-- ENT.MeleeAttackDistance = 35
-- ENT.MeleeAttackDamageDistance = 45
ENT.TimeUntilMeleeAttackDamage = 0.2
ENT.NextMeleeAttackTime = 0.1
--------------------
ENT.FootstepSoundTimerWalk = 0.15
ENT.FootstepSoundTimerRun = 0.15
ENT.SoundTbl_ReceiveOrder = {
	"vo/scout_yes01.mp3",
	"vo/scout_yes02.mp3",
	"vo/scout_yes03.mp3"
}
ENT.SoundTbl_MedicReceiveHeal = {
	"vo/scout_thanksfortheheal01.mp3",
	"vo/scout_thanksfortheheal02.mp3",
	"vo/scout_thanksfortheheal03.mp3"
}
ENT.SoundTbl_CallForHelp = {
	"vo/scout_helpme01.mp3",
	"vo/scout_helpme02.mp3",
	"vo/scout_helpme03.mp3",
	"vo/scout_helpme04.mp3"
}
ENT.SoundTbl_MeleeAttackExtra = "weapons/bat_hit.wav"
ENT.SoundTbl_MeleeAttackMiss = "weapons/cbar_miss1.wav"
ENT.SoundTbl_AllyDeath = {
	"vo/scout_negativevocalization01.mp3",
	"vo/scout_negativevocalization02.mp3",
	"vo/scout_negativevocalization03.mp3",
	"vo/scout_negativevocalization04.mp3",
	"vo/scout_negativevocalization05.mp3"
}
ENT.SoundTbl_Pain = {
	"vo/scout_painsharp01.mp3",
	"vo/scout_painsharp02.mp3",
	"vo/scout_painsharp03.mp3",
	"vo/scout_painsharp04.mp3",
	"vo/scout_painsharp05.mp3",
	"vo/scout_painsharp06.mp3",
	"vo/scout_painsharp07.mp3",
	"vo/scout_painsharp08.mp3"
}
ENT.SoundTbl_Death = {
	"vo/scout_painsevere01.mp3",
	"vo/scout_painsevere02.mp3",
	"vo/scout_painsevere03.mp3",
	"vo/scout_painsevere04.mp3",
	"vo/scout_painsevere05.mp3",
	"vo/scout_painsevere06.mp3"
}
--------------------
ENT.BeanTF2Zombs_SoundTbl_BattleCry = {
	"vo/scout_battlecry01.mp3",
	"vo/scout_battlecry02.mp3",
	"vo/scout_battlecry03.mp3",
	"vo/scout_battlecry04.mp3",
	"vo/scout_battlecry05.mp3"
}
ENT.BeanTF2Zombs_SoundTbl_MeleeTaunt = {
	"vo/scout_meleedare01.mp3",
	"vo/scout_meleedare02.mp3",
	"vo/scout_meleedare03.mp3",
	"vo/scout_meleedare04.mp3",
	"vo/scout_meleedare05.mp3",
	"vo/scout_misc03.mp3",
	"vo/taunts/scout_taunts05.mp3",
	"vo/taunts/scout_taunts05.mp3",
	"vo/taunts/scout_taunts10.mp3"
}
ENT.BeanTF2Zombs_SoundTbl_GoMove = {
	"vo/scout_go01.mp3",
	"vo/scout_go02.mp3",
	"vo/scout_go03.mp3",
	"vo/scout_go03.mp3",
	"vo/scout_moveup01.mp3",
	"vo/scout_moveup02.mp3",
	"vo/scout_moveup03.mp3"
}
ENT.BeanTF2Zombs_SoundTbl_Incoming = {
	"vo/scout_incoming01.mp3",
	"vo/scout_incoming02.mp3",
	"vo/scout_incoming03.mp3"
}
ENT.BeanTF2Zombs_SoundTbl_SentryAhead = {
	"vo/scout_sentryahead01.mp3",
	"vo/scout_sentryahead02.mp3",
	"vo/scout_sentryahead03.mp3"
}
ENT.BeanTF2Zombs_SoundTbl_Pain_Fire = {
	"vo/scout_autoonfire01.mp3",
	"vo/scout_autoonfire02.mp3"
}
ENT.BeanTF2Zombs_SoundTbl_Death_Critical = {
	"vo/scout_paincrticialdeath01.mp3",
	"vo/scout_paincrticialdeath02.mp3",
	"vo/scout_paincrticialdeath03.mp3"
}
--------------------
function ENT:Init()

	self.WeaponModel = ents.Create("prop_physics")
	
	self.WeaponModel:SetModel("models/weapons/w_models/w_bat.mdl")
	self.SoundTbl_KilledEnemy = {
		"vo/scout_specialcompleted02.mp3",
		"vo/scout_specialcompleted03.mp3",
		"vo/scout_specialcompleted11.mp3",
		"vo/taunts/scout_taunts08.mp3",
		-- these are exclusive to this weapon
		"vo/scout_specialcompleted04.mp3",
		"vo/scout_specialcompleted06.mp3",
		"vo/scout_specialcompleted07.mp3",
		"vo/taunts/scout_taunts11.mp3",
		"vo/scout_specialcompleted09.mp3",
	}

	self.WeaponModel:SetLocalPos(self:GetPos())
	self.WeaponModel:SetLocalAngles(self:GetAngles())			
	self.WeaponModel:SetOwner(self)
	self.WeaponModel:SetParent(self)
	self.WeaponModel:Fire("SetParentAttachment","weapon_bone")
	self.WeaponModel:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
	self.WeaponModel:Spawn()
	self.WeaponModel:Activate()
	self.WeaponModel:SetSolid(SOLID_NONE)
	self.WeaponModel:AddEffects(EF_BONEMERGE)

	if math.random(1,2) == 1 then
		self:SetSkin(1)
	end

	if self:GetModel() == "models/lazy_zombies_v1/scout.mdl" then
		self:SetFlexWeight(0,0.25)
		self:SetFlexWeight(1,0.25)
		self:SetFlexWeight(2,0.5)
	end

end
--------------------
function ENT:BeanTF2Zombs_Taunt()

	if math.random(1,5) == 1 then

		self:PlayAnim("vjseq_layer_taunt_laugh", true, 5)
		self.WeaponModel:SetNoDraw(true)
		self:PlaySoundSystem("Speech","vo/scout_laughlong02.mp3")
		timer.Simple(5,function() if IsValid(self) then
			self.WeaponModel:SetNoDraw(false)
		end end)

	else

		self:PlayAnim("vjseq_taunt03", true, 4)

		local randomlinetopick = math.random(1,6)

		if randomlinetopick == 1 then
			self:PlaySoundSystem("Speech","vo/taunts/scout_taunts12.mp3")
			timer.Simple(2.5,function() if IsValid(self) then
				self:PlaySoundSystem("Speech","vo/scout_specialcompleted03.mp3")
			end end)
		elseif randomlinetopick == 2 then
			self:PlaySoundSystem("Speech","vo/taunts/scout_taunts03.mp3")
			timer.Simple(2.5,function() if IsValid(self) then
				self:PlaySoundSystem("Speech","vo/scout_specialcompleted03.mp3")
			end end)
		elseif randomlinetopick == 3 then
			self:PlaySoundSystem("Speech","vo/scout_specialcompleted09.mp3")
			timer.Simple(2.5,function() if IsValid(self) then
				self:PlaySoundSystem("Speech","vo/scout_specialcompleted02.mp3")
			end end)
		elseif randomlinetopick == 4 then
			self:PlaySoundSystem("Speech","vo/taunts/scout_taunts07.mp3")
			timer.Simple(2.5,function() if IsValid(self) then
				self:PlaySoundSystem("Speech","vo/scout_specialcompleted03.mp3")
			end end)
		elseif randomlinetopick == 5 then
			timer.Simple(2.5,function() if IsValid(self) then
				self:PlaySoundSystem("Speech","vo/scout_specialcompleted02.mp3")
			end end)
		else
			timer.Simple(2.5,function() if IsValid(self) then
				self:PlaySoundSystem("Speech","vo/scout_specialcompleted03.mp3")
			end end)
		end

	end

end
--------------------
local BeanTF2Zombs_NPCsConsideredScout = {
	npc_scout_red = true,
	npc_scout_blue = true
}
local BeanTF2Zombs_NPCsConsideredSoldier = {
	npc_soldier_red = true,
	npc_soldier_blue = true
}
local BeanTF2Zombs_NPCsConsideredPyro = {
	npc_pyro_red = true,
	npc_pyro_blue = true
}
local BeanTF2Zombs_NPCsConsideredDemoman = {
	npc_demo_red = true,
	npc_demo_blue = true
}
local BeanTF2Zombs_NPCsConsideredHeavy = {
	npc_hwg_red = true,
	npc_hwg_blue = true
}
local BeanTF2Zombs_NPCsConsideredEngineer = {
	npc_engineer_red = true,
	npc_engineer_blue = true
}
local BeanTF2Zombs_NPCsConsideredMedic = {
	npc_medic_red = true,
	npc_medic_blue = true
}
local BeanTF2Zombs_NPCsConsideredSniper = {
	npc_sniper_red = true,
	npc_sniper_blue = true,
	npc_sniperbot_red = true,
	npc_sniperbot_blue = true
}
local BeanTF2Zombs_NPCsConsideredSpy = {
	npc_spy_red = true,
	npc_spy_blue = true
}
-----
function ENT:OnKilledEnemy(ent, inflictor, wasLast)

	-- self.BeanTF2Zombs_TotalKills = self.BeanTF2Zombs_TotalKills + 1

	-- if math.random(1,1) == 1 && (!IsValid(self:GetEnemy()) or (IsValid(self:GetEnemy()) && (self:GetPos():Distance(self:GetEnemy():GetPos()) >= 500 or !self:GetEnemy().VJ_ID_Living))) then
	if math.random(1,3) == 1 then
		self.BeanTF2Zombs_OriginalKilledEnemyLines = self.SoundTbl_KilledEnemy
		self.SoundTbl_KilledEnemy = {
			"vo/scout_domination02.mp3",
			"vo/scout_domination15.mp3",
			"vo/scout_domination16.mp3",
			"vo/scout_misc07.mp3"
		}
		if BeanTF2Zombs_NPCsConsideredScout[ent:GetClass()] then
			self.SoundTbl_KilledEnemy = {
				"vo/scout_domination13.mp3",
				"vo/scout_domination07.mp3",
				"vo/scout_domination05.mp3",
				"vo/scout_domination20.mp3",
				"vo/scout_domination19.mp3",
				"vo/scout_domination21.mp3",
				"vo/scout_domination14.mp3",
				"vo/scout_dominationsct01.mp3",
				"vo/scout_dominationsct02.mp3",
				"vo/scout_dominationsct03.mp3",
				"vo/scout_misc07.mp3"
			}
		elseif BeanTF2Zombs_NPCsConsideredSoldier[ent:GetClass()] then
			self.SoundTbl_KilledEnemy = {
				"vo/scout_dominationsol01.mp3",
				"vo/scout_dominationsol02.mp3",
				"vo/scout_dominationsol03.mp3",
				"vo/scout_dominationsol04.mp3",
				"vo/scout_dominationsol05.mp3",
				"vo/scout_dominationsol06.mp3"
			}
		elseif BeanTF2Zombs_NPCsConsideredPyro[ent:GetClass()] then
			self.SoundTbl_KilledEnemy = {
				"vo/scout_domination06.mp3",
				"vo/scout_dominationpyr01.mp3",
				"vo/scout_dominationpyr02.mp3",
				"vo/scout_dominationpyr03.mp3",
				"vo/scout_dominationpyr04.mp3",
				"vo/scout_dominationpyr05.mp3",
				"vo/scout_dominationpyr06.mp3",
				"vo/scout_misc08.mp3"
			}
		elseif BeanTF2Zombs_NPCsConsideredDemoman[ent:GetClass()] then
			self.SoundTbl_KilledEnemy = {
				"vo/scout_domination01.mp3",
				"vo/scout_domination10.mp3",
				"vo/scout_dominationdem01.mp3",
				"vo/scout_dominationdem02.mp3",
				"vo/scout_dominationdem03.mp3",
				"vo/scout_dominationdem04.mp3",
				"vo/scout_dominationdem05.mp3"
			}
		elseif BeanTF2Zombs_NPCsConsideredHeavy[ent:GetClass()] then
			self.SoundTbl_KilledEnemy = {
				"vo/scout_domination08.mp3",
				"vo/scout_domination09.mp3",
				"vo/scout_dominationhvy01.mp3",
				"vo/scout_dominationhvy02.mp3",
				"vo/scout_dominationhvy03.mp3",
				"vo/scout_dominationhvy04.mp3",
				"vo/scout_dominationhvy05.mp3",
				"vo/scout_dominationhvy06.mp3",
				"vo/scout_dominationhvy07.mp3",
				"vo/scout_dominationhvy08.mp3",
				"vo/scout_dominationhvy09.mp3",
				"vo/scout_dominationhvy10.mp3"
			}
		elseif BeanTF2Zombs_NPCsConsideredEngineer[ent:GetClass()] then
			self.SoundTbl_KilledEnemy = {
				"vo/scout_domination17.mp3",
				"vo/scout_dominationeng01.mp3",
				"vo/scout_dominationeng02.mp3",
				"vo/scout_dominationeng03.mp3",
				"vo/scout_dominationeng04.mp3",
				"vo/scout_dominationeng05.mp3",
				"vo/scout_dominationeng06.mp3"
			}
		elseif BeanTF2Zombs_NPCsConsideredMedic[ent:GetClass()] then
			self.SoundTbl_KilledEnemy = {
				"vo/scout_misc02.mp3",
				"vo/scout_dominationmed01.mp3",
				"vo/scout_dominationmed02.mp3",
				"vo/scout_dominationmed03.mp3",
				"vo/scout_dominationmed04.mp3",
				"vo/scout_dominationmed05.mp3",
				"vo/scout_dominationmed06.mp3"
			}
		elseif BeanTF2Zombs_NPCsConsideredSniper[ent:GetClass()] then
			self.SoundTbl_KilledEnemy = {
				"vo/scout_domination12.mp3",
				"vo/scout_dominationsnp01.mp3",
				"vo/scout_dominationsnp02.mp3",
				"vo/scout_dominationsnp03.mp3",
				"vo/scout_dominationsnp04.mp3",
				"vo/scout_dominationsnp05.mp3"
			}
		elseif BeanTF2Zombs_NPCsConsideredSpy[ent:GetClass()] then
			self.SoundTbl_KilledEnemy = {
				"vo/scout_award10.mp3",
				"vo/scout_dominationspy01.mp3",
				"vo/scout_dominationspy02.mp3",
				"vo/scout_dominationspy03.mp3",
				"vo/scout_dominationspy04.mp3"
			}
		end
		timer.Simple(0.1, function() if IsValid(self) then
			self.SoundTbl_KilledEnemy = self.BeanTF2Zombs_OriginalKilledEnemyLines
			-- self.BeanTF2Zombs_TotalKills = 0
		end end)
	-- else
	end

	if math.random(1,5) == 1 then
		timer.Simple(math.random(0.30,0.5), function() if IsValid(self) then
			self:BeanTF2Zombs_Taunt()
		end end)
	end

end