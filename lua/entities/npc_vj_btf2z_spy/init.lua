include("entities/npc_vj_btf2z_soldier/init.lua")
AddCSLuaFile("shared.lua")
include('shared.lua')
--------------------
ENT.Model = {
	"models/zombies/boneless/hwm/spy.mdl",
	"models/lazy_zombies_v1/spy.mdl"
}
ENT.StartHealth = 125
--------------------
ENT.MeleeAttackDamage = 40
ENT.AnimTbl_MeleeAttack = "vjges_melee_swing"
-- ENT.MeleeAttackDistance = 45
-- ENT.MeleeAttackDamageDistance = 60
ENT.TimeUntilMeleeAttackDamage = 0.2
-- ENT.NextMeleeAttackTime = 0.8
--------------------
ENT.SoundTbl_MedicReceiveHeal = {
	"vo/spy_thanksfortheheal01.mp3",
	"vo/spy_thanksfortheheal02.mp3",
	"vo/spy_thanksfortheheal03.mp3"
}
ENT.SoundTbl_CallForHelp = {
	"vo/spy_helpme01.mp3",
	"vo/spy_helpme02.mp3",
	"vo/spy_helpme03.mp3"
}
ENT.SoundTbl_MeleeAttackExtra = {
	"weapons/blade_hit1.wav",
	"weapons/blade_hit2.wav",
	"weapons/blade_hit3.wav",
	"weapons/blade_hit4.wav",
}
ENT.SoundTbl_MeleeAttackMiss = "weapons/knife_swing.wav"
ENT.SoundTbl_AllyDeath = {
	"vo/spy_negativevocalization01.mp3",
	"vo/spy_negativevocalization02.mp3",
	"vo/spy_negativevocalization03.mp3",
	"vo/spy_negativevocalization04.mp3",
	"vo/spy_negativevocalization05.mp3",
	"vo/spy_negativevocalization06.mp3",
	"vo/spy_negativevocalization07.mp3",
	"vo/spy_negativevocalization08.mp3",
	"vo/spy_negativevocalization09.mp3"
}
ENT.SoundTbl_Pain = {
	"vo/spy_painsharp01.mp3",
	"vo/spy_painsharp02.mp3",
	"vo/spy_painsharp03.mp3",
	"vo/spy_painsharp04.mp3"
}
ENT.SoundTbl_Pain_Fire = {
	"vo/spy_autoonfire01.mp3",
	"vo/spy_autoonfire02.mp3",
	"vo/spy_autoonfire03.mp3",
}
ENT.SoundTbl_Death = {
	"vo/spy_painsevere01.mp3",
	"vo/spy_painsevere02.mp3",
	"vo/spy_painsevere03.mp3",
	"vo/spy_painsevere04.mp3",
	"vo/spy_painsevere05.mp3"
}
ENT.SoundTbl_Death_Critical = {
	"vo/spy_paincrticialdeath01.mp3",
	"vo/spy_paincrticialdeath02.mp3",
	"vo/spy_paincrticialdeath03.mp3"
}
--------------------
ENT.SoundTbl_BattleCry = {
	"vo/spy_battlecry01.mp3",
	"vo/spy_battlecry03.mp3",
	"vo/spy_battlecry04.mp3"
}
ENT.SoundTbl_GoMove = {
	"vo/spy_go01.mp3",
	"vo/spy_go02.mp3",
	"vo/spy_go03.mp3",
	"vo/spy_moveup01.mp3",
	"vo/spy_moveup02.mp3"
}
ENT.SoundTbl_MeleeTaunt = {
	"vo/spy_meleedare01.mp3",
	"vo/spy_meleedare02.mp3",
	"vo/spy_specialcompleted09.mp3",
	"vo/taunts/spy_taunts01.mp3",
	"vo/taunts/spy_taunts10.mp3",
	"vo/taunts/spy_taunts11.mp3",
	"vo/taunts/spy_taunts13.mp3"
}
ENT.SoundTbl_SentryAhead = {
	"vo/spy_sentryahead01.mp3",
	"vo/spy_sentryahead02.mp3"
}
ENT.SoundTbl_Incoming = {
	"vo/spy_incoming01.mp3",
	"vo/spy_incoming02.mp3",
	"vo/spy_incoming03.mp3"
}
ENT.BeanTF2Zombs_SpyMeleeTauntLines = {
	"vo/taunts/spy_taunts02.mp3",
	"vo/taunts/spy_taunts09.mp3"
}
--------------------
function ENT:Init()

	self.WeaponModel = ents.Create("prop_physics")
	
	self.WeaponModel:SetModel("models/weapons/w_models/w_knife.mdl")
	self.SoundTbl_KilledEnemy = {
		"vo/spy_specialcompleted11.mp3",
		"vo/spy_specialcompleted02.mp3",
		"vo/spy_specialcompleted03.mp3",
		"vo/spy_specialcompleted06.mp3",
		"vo/spy_specialcompleted08.mp3",
		"vo/spy_specialcompleted01.mp3",
		"vo/spy_specialcompleted12.mp3",
		"vo/spy_specialcompleted04.mp3",
		"vo/taunts/spy_taunts06.mp3",
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

end
--------------------
function ENT:BeanTF2Zombs_Taunt()

	if math.random(1,5) == 1 then

		self:PlayAnim("vjseq_layer_taunt_laugh", true, 7)
		self.WeaponModel:SetNoDraw(true)
		self:PlaySoundSystem("Speech","vo/spy_laughlong01.mp3")
		timer.Simple(7,function() if IsValid(self) then
			self.WeaponModel:SetNoDraw(false)
		end end)

	else

		self:PlayAnim("vjseq_layer_taunt03", true, 5)
		timer.Simple(1,function() if IsValid(self) then
			self:PlaySoundSystem("Speech",self.BeanTF2Zombs_SpyMeleeTauntLines)
		end end)

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
			"vo/spy_specialcompleted03.mp3",
			"vo/spy_specialcompleted07.mp3",
			"vo/spy_specialcompleted11.mp3",
			"vo/spy_dominationspy03.mp3",
			"vo/spy_dominationspy04.mp3"
		}
		if BeanTF2Zombs_NPCsConsideredScout[ent:GetClass()] then
			self.SoundTbl_KilledEnemy = {
				"vo/spy_dominationscout01.mp3",
				"vo/spy_dominationscout02.mp3",
				"vo/spy_dominationscout03.mp3",
				"vo/spy_dominationscout04.mp3",
				"vo/spy_dominationscout05.mp3",
				"vo/spy_dominationscout06.mp3",
				"vo/spy_dominationscout07.mp3",
				"vo/spy_dominationscout08.mp3",
				"vo/spy_dominationscout09.mp3"
			}
		elseif BeanTF2Zombs_NPCsConsideredSoldier[ent:GetClass()] then
			self.SoundTbl_KilledEnemy = {
				"vo/spy_dominationsoldier01.mp3",
				"vo/spy_dominationsoldier02.mp3",
				"vo/spy_dominationsoldier03.mp3",
				"vo/spy_dominationsoldier04.mp3",
				"vo/spy_dominationsoldier05.mp3"
			}
		elseif BeanTF2Zombs_NPCsConsideredPyro[ent:GetClass()] then
			self.SoundTbl_KilledEnemy = {
				"vo/spy_dominationpyro01.mp3",
				"vo/spy_dominationpyro02.mp3",
				"vo/spy_dominationpyro03.mp3",
				"vo/spy_dominationpyro04.mp3",
				"vo/spy_dominationpyro05.mp3"
			}
		elseif BeanTF2Zombs_NPCsConsideredDemoman[ent:GetClass()] then
			self.SoundTbl_KilledEnemy = {
				"vo/spy_dominationdemoman01.mp3",
				"vo/spy_dominationdemoman02.mp3",
				"vo/spy_dominationdemoman04.mp3",
				"vo/spy_dominationdemoman05.mp3",
				"vo/spy_dominationdemoman06.mp3",
				"vo/spy_dominationdemoman07.mp3"
			}
		elseif BeanTF2Zombs_NPCsConsideredHeavy[ent:GetClass()] then
			self.SoundTbl_KilledEnemy = {
				"vo/spy_dominationheavy01.mp3",
				"vo/spy_dominationheavy02.mp3",
				"vo/spy_dominationheavy03.mp3",
				"vo/spy_dominationheavy04.mp3",
				"vo/spy_dominationheavy05.mp3",
				"vo/spy_dominationheavy06.mp3",
				"vo/spy_dominationheavy07.mp3",
				"vo/spy_dominationheavy08.mp3"
			}
		elseif BeanTF2Zombs_NPCsConsideredEngineer[ent:GetClass()] then
			self.SoundTbl_KilledEnemy = {
				"vo/spy_dominationengineer01.mp3",
				"vo/spy_dominationengineer02.mp3",
				"vo/spy_dominationengineer03.mp3",
				"vo/spy_dominationengineer04.mp3",
				"vo/spy_dominationengineer05.mp3",
				"vo/spy_dominationengineer06.mp3"
			}
		elseif BeanTF2Zombs_NPCsConsideredMedic[ent:GetClass()] then
			self.SoundTbl_KilledEnemy = {
				"vo/spy_dominationmedic01.mp3",
				"vo/spy_dominationmedic02.mp3",
				"vo/spy_dominationmedic03.mp3",
				"vo/spy_dominationmedic04.mp3",
				"vo/spy_dominationmedic05.mp3",
				"vo/spy_dominationmedic06.mp3"
			}
		elseif BeanTF2Zombs_NPCsConsideredSniper[ent:GetClass()] then
			self.SoundTbl_KilledEnemy = {
				"vo/spy_dominationsniper01.mp3",
				"vo/spy_dominationsniper02.mp3",
				"vo/spy_dominationsniper03.mp3",
				"vo/spy_dominationsniper04.mp3",
				"vo/spy_dominationsniper05.mp3",
				"vo/spy_dominationsniper06.mp3",
				"vo/spy_dominationsniper07.mp3"
			}
		elseif BeanTF2Zombs_NPCsConsideredSpy[ent:GetClass()] then
			self.SoundTbl_KilledEnemy = {
				"vo/spy_dominationspy01.mp3",
				"vo/spy_dominationspy02.mp3",
				"vo/spy_dominationspy03.mp3",
				"vo/spy_dominationspy04.mp3",
				"vo/spy_dominationspy05.mp3"
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