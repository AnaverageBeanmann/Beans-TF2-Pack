include("entities/npc_vj_btf2z_soldier/init.lua")
AddCSLuaFile("shared.lua")
include('shared.lua')
--------------------
ENT.Model = {
	"models/zombies/boneless/hwm/medic.mdl",
	"models/lazy_zombies_v1/medic.mdl"
}
ENT.StartHealth = 150
ENT.HealthRegenParams = {
	Enabled = true,
	Amount = 3,
	Delay = VJ.SET(1,1),
	ResetOnDmg = false,
}
--------------------
ENT.MeleeAttackDamageType = DMG_SLASH
ENT.AnimTbl_MeleeAttack = "vjges_layer_melee_swing"
-- ENT.MeleeAttackDistance = 45
-- ENT.MeleeAttackDamageDistance = 60
-- ENT.TimeUntilMeleeAttackDamage = 0.2
-- ENT.NextMeleeAttackTime = 0.8
--------------------
ENT.SoundTbl_MedicReceiveHeal = {
	"vo/medic_thanksfortheheal01.mp3",
	"vo/medic_thanksfortheheal02.mp3"
}
ENT.SoundTbl_CallForHelp = {
	"vo/medic_helpme01.mp3",
	"vo/medic_helpme02.mp3",
	"vo/medic_helpme03.mp3"
}
ENT.SoundTbl_MeleeAttackExtra = {
	"weapons/cbar_hitbod1.wav",
	"weapons/cbar_hitbod2.wav",
	"weapons/cbar_hitbod3.wav",
}
ENT.SoundTbl_MeleeAttackMiss = "weapons/cbar_miss1.wav"
ENT.SoundTbl_AllyDeath = {
	"vo/medic_negativevocalization01.mp3",
	"vo/medic_negativevocalization02.mp3",
	"vo/medic_negativevocalization03.mp3",
	"vo/medic_negativevocalization04.mp3",
	"vo/medic_negativevocalization05.mp3",
	"vo/medic_negativevocalization06.mp3",
	"vo/medic_negativevocalization07.mp3"
}
ENT.SoundTbl_Pain = {
	"vo/medic_painsharp01.mp3",
	"vo/medic_painsharp02.mp3",
	"vo/medic_painsharp03.mp3",
	"vo/medic_painsharp04.mp3",
	"vo/medic_painsharp05.mp3",
	"vo/medic_painsharp06.mp3",
	"vo/medic_painsharp07.mp3",
	"vo/medic_painsharp08.mp3"
}
ENT.SoundTbl_Pain_Fire = {
	"vo/medic_autoonfire01.mp3",
	"vo/medic_autoonfire02.mp3",
	"vo/medic_autoonfire03.mp3",
	"vo/medic_autoonfire04.mp3",
	"vo/medic_autoonfire05.mp3"
}
ENT.SoundTbl_Death = {
	"vo/medic_painsevere01.mp3",
	"vo/medic_painsevere02.mp3",
	"vo/medic_painsevere03.mp3",
	"vo/medic_painsevere04.mp3"
}
ENT.SoundTbl_Death_Critical = {
	"vo/medic_paincrticialdeath01.mp3",
	"vo/medic_paincrticialdeath02.mp3",
	"vo/medic_paincrticialdeath03.mp3",
	"vo/medic_paincrticialdeath04.mp3"
}
--------------------
ENT.SoundTbl_BattleCry = {
	"vo/engineer_battlecry01.mp3",
	"vo/engineer_battlecry02.mp3",
	"vo/engineer_battlecry03.mp3",
	"vo/engineer_battlecry04.mp3",
	"vo/engineer_battlecry05.mp3",
	"vo/engineer_battlecry06.mp3",
	"vo/engineer_battlecry07.mp3"
}
ENT.SoundTbl_GoMove = {
	"vo/engineer_go01.mp3",
	"vo/engineer_go02.mp3",
	"vo/engineer_go03.mp3",
	"vo/engineer_moveup01.mp3"
}
ENT.SoundTbl_MeleeTaunt = {
	"vo/taunts/medic_taunts01.mp3",
	"vo/taunts/medic_taunts04.mp3",
	"vo/taunts/medic_taunts05.mp3",
	"vo/taunts/medic_taunts06.mp3",
	"vo/taunts/medic_taunts10.mp3",
	"vo/taunts/medic_taunts12.mp3",
	"vo/taunts/medic_taunts13.mp3",
	"vo/taunts/medic_taunts15.mp3"
}
ENT.SoundTbl_SentryAhead = {
	"vo/engineer_sentryahead01.mp3",
	"vo/engineer_sentryahead02.mp3"
}
ENT.SoundTbl_Incoming = {
	"vo/engineer_incoming01.mp3",
	"vo/engineer_incoming02.mp3",
	"vo/engineer_incoming03.mp3"
}
ENT.SoundTbl_BonesawTauntSounds = {
	"player/taunt_v01.wav",
	"player/taunt_v02.wav",
	"player/taunt_v03.wav",
	"player/taunt_v04.wav",
	"player/taunt_v05.wav",
	"player/taunt_v06.wav",
	"player/taunt_v07.wav"
}
ENT.BeanTF2Zombs_WeaponAttachment = "effect_hand_r"
--------------------
function ENT:Init()

	self.WeaponModel = ents.Create("prop_physics")
	
	self.WeaponModel:SetModel("models/weapons/w_models/w_bonesaw.mdl")
	self.SoundTbl_KilledEnemy = {
		"vo/medic_specialcompleted01.mp3",
		"vo/medic_specialcompleted09.mp3",
		"vo/medic_specialcompleted02.mp3",
		"vo/medic_specialcompleted10.mp3",
		"vo/medic_specialcompleted11.mp3",
	}

	self.WeaponModel:SetLocalPos(self:GetPos())
	self.WeaponModel:SetLocalAngles(self:GetAngles())			
	self.WeaponModel:SetOwner(self)
	self.WeaponModel:SetParent(self)
	self.WeaponModel:Fire("SetParentAttachment","effect_hand_r")
	self.WeaponModel:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
	self.WeaponModel:Spawn()
	self.WeaponModel:Activate()
	self.WeaponModel:SetSolid(SOLID_NONE)
	self.WeaponModel:AddEffects(EF_BONEMERGE)

	if math.random(1,2) == 1 then
		self:SetSkin(1)
	end

	if self:GetModel() == "models/lazy_zombies_v1/medic.mdl" then
		self:SetFlexWeight(0,0.25)
		self:SetFlexWeight(1,0.25)
		self:SetFlexWeight(2,0.5)
	end

end
--------------------
function ENT:BeanTF2Zombs_Taunt()

	if math.random(1,5) == 1 then

		self:PlayAnim("vjseq_layer_taunt_laugh", true, 4.5)
		self.WeaponModel:SetNoDraw(true)
		self:PlaySoundSystem("Speech","vo/medic_laughlong01.mp3")
		timer.Simple(4.5,function() if IsValid(self) then
			self.WeaponModel:SetNoDraw(false)
		end end)

	else

		self:PlayAnim("vjseq_layer_taunt03", true, 4)
		timer.Simple(1,function() if IsValid(self) then
			VJ.EmitSound(self,self.SoundTbl_BonesawTauntSounds,80,100)
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
			"vo/engineer_taunts05.mp3",
			"vo/engineer_taunts08.mp3",
			"vo/engineer_wranglekills04.mp3"
		}
		if BeanTF2Zombs_NPCsConsideredScout[ent:GetClass()] then
			self.SoundTbl_KilledEnemy = {
				"vo/engineer_dominationscout01.mp3",
				"vo/engineer_dominationscout02.mp3",
				"vo/engineer_dominationscout03.mp3",
				"vo/engineer_dominationscout04.mp3",
				"vo/engineer_dominationscout05.mp3",
				"vo/engineer_dominationscout06.mp3",
				"vo/engineer_dominationscout07.mp3",
				"vo/engineer_dominationscout08.mp3",
				"vo/engineer_dominationscout09.mp3",
				"vo/engineer_dominationscout10.mp3",
				"vo/engineer_dominationscout11.mp3",
				"vo/engineer_dominationscout12.mp3"
			}
		elseif BeanTF2Zombs_NPCsConsideredSoldier[ent:GetClass()] then
			self.SoundTbl_KilledEnemy = {
				"vo/engineer_dominationsoldier01.mp3",
				"vo/engineer_dominationsoldier02.mp3",
				"vo/engineer_dominationsoldier03.mp3",
				"vo/engineer_dominationsoldier04.mp3",
				"vo/engineer_dominationsoldier05.mp3",
				"vo/engineer_dominationsoldier06.mp3",
				"vo/engineer_dominationsoldier07.mp3",
				"vo/engineer_dominationsoldier08.mp3"
			}
		elseif BeanTF2Zombs_NPCsConsideredPyro[ent:GetClass()] then
			self.SoundTbl_KilledEnemy = {
				"vo/engineer_dominationpyro01.mp3",
				"vo/engineer_dominationpyro02.mp3",
				"vo/engineer_dominationpyro03.mp3",
				"vo/engineer_dominationpyro04.mp3",
				"vo/engineer_dominationpyro05.mp3",
				"vo/engineer_dominationpyro06.mp3",
				"vo/engineer_dominationpyro07.mp3",
				"vo/engineer_dominationpyro08.mp3",
				"vo/engineer_dominationpyro09.mp3"
			}
		elseif BeanTF2Zombs_NPCsConsideredDemoman[ent:GetClass()] then
			self.SoundTbl_KilledEnemy = {
				"vo/engineer_dominationdemoman01.mp3",
				"vo/engineer_dominationdemoman02.mp3",
				"vo/engineer_dominationdemoman03.mp3",
				"vo/engineer_dominationdemoman04.mp3",
				"vo/engineer_dominationdemoman05.mp3",
				"vo/engineer_dominationdemoman06.mp3"
			}
		elseif BeanTF2Zombs_NPCsConsideredHeavy[ent:GetClass()] then
			self.SoundTbl_KilledEnemy = {
				"vo/engineer_dominationheavy01.mp3",
				"vo/engineer_dominationheavy02.mp3",
				"vo/engineer_dominationheavy03.mp3",
				"vo/engineer_dominationheavy04.mp3",
				"vo/engineer_dominationheavy05.mp3",
				"vo/engineer_dominationheavy06.mp3",
				"vo/engineer_dominationheavy07.mp3",
				"vo/engineer_dominationheavy08.mp3",
				"vo/engineer_dominationheavy09.mp3",
				"vo/engineer_dominationheavy10.mp3",
				"vo/engineer_dominationheavy11.mp3",
				"vo/engineer_dominationheavy12.mp3",
				"vo/engineer_dominationheavy13.mp3",
				"vo/engineer_dominationheavy14.mp3",
				"vo/engineer_dominationheavy15.mp3"
			}
		elseif BeanTF2Zombs_NPCsConsideredEngineer[ent:GetClass()] then
			self.SoundTbl_KilledEnemy = {
				"vo/engineer_dominationengineer01.mp3",
				"vo/engineer_dominationengineer02.mp3",
				"vo/engineer_dominationengineer03.mp3",
				"vo/engineer_dominationengineer04.mp3",
				"vo/engineer_dominationengineer05.mp3",
				"vo/engineer_dominationengineer06.mp3",
				"vo/engineer_dominationengineer07.mp3",
				"vo/engineer_dominationengineer08.mp3",
				"vo/engineer_dominationengineer09.mp3"
			}
		elseif BeanTF2Zombs_NPCsConsideredMedic[ent:GetClass()] then
			self.SoundTbl_KilledEnemy = {
				"vo/engineer_dominationmedic01.mp3",
				"vo/engineer_dominationmedic02.mp3",
				"vo/engineer_dominationmedic03.mp3",
				"vo/engineer_dominationmedic04.mp3",
				"vo/engineer_dominationmedic05.mp3",
				"vo/engineer_dominationmedic06.mp3",
				"vo/engineer_dominationmedic07.mp3",
				"vo/engineer_dominationmedic08.mp3"
			}
		elseif BeanTF2Zombs_NPCsConsideredSniper[ent:GetClass()] then
			self.SoundTbl_KilledEnemy = {
				"vo/engineer_dominationsniper01.mp3",
				"vo/engineer_dominationsniper02.mp3",
				"vo/engineer_dominationsniper03.mp3",
				"vo/engineer_dominationsniper04.mp3",
				"vo/engineer_dominationsniper05.mp3",
				"vo/engineer_dominationsniper06.mp3",
				"vo/engineer_dominationsniper07.mp3",
				"vo/engineer_dominationsniper08.mp3"
			}
		elseif BeanTF2Zombs_NPCsConsideredSpy[ent:GetClass()] then
			self.SoundTbl_KilledEnemy = {
				"vo/engineer_dominationspy01.mp3",
				"vo/engineer_dominationspy02.mp3",
				"vo/engineer_dominationspy03.mp3",
				"vo/engineer_dominationspy04.mp3",
				"vo/engineer_dominationspy05.mp3",
				"vo/engineer_dominationspy06.mp3",
				"vo/engineer_dominationspy07.mp3",
				"vo/engineer_dominationspy08.mp3",
				"vo/engineer_dominationspy09.mp3",
				"vo/engineer_dominationspy10.mp3",
				"vo/engineer_dominationspy11.mp3",
				"vo/engineer_dominationspy12.mp3",
				"vo/engineer_dominationspy13.mp3"
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