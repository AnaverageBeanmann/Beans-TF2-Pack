include("entities/npc_vj_btf2z_soldier/init.lua")
AddCSLuaFile("shared.lua")
include('shared.lua')
--------------------
ENT.Model = {
	"models/zombies/boneless/hwm/sniper.mdl",
	"models/lazy_zombies_v1/sniper.mdl"
}
ENT.StartHealth = 125
ENT.ControllerParams = {
	ThirdP_Offset = Vector(20, 0, -30),
	FirstP_Bone = "bip_head",
	FirstP_Offset = Vector(0, 0, 0), 
	FirstP_ShrinkBone = true,
}
--------------------
ENT.AnimTbl_MeleeAttack = "vjges_melee_swing"
-- ENT.MeleeAttackDistance = 45
-- ENT.MeleeAttackDamageDistance = 60
ENT.TimeUntilMeleeAttackDamage = 0.3
-- ENT.NextMeleeAttackTime = 0.8
--------------------
ENT.FootstepSoundTimerWalk = 0.25
ENT.FootstepSoundTimerRun = 0.25
ENT.SoundTbl_MedicReceiveHeal = {
	"vo/sniper_thanksfortheheal01.mp3",
	"vo/sniper_thanksfortheheal02.mp3",
	"vo/sniper_thanksfortheheal03.mp3"
}
ENT.SoundTbl_CallForHelp = {
	"vo/sniper_helpme01.mp3",
	"vo/sniper_helpme02.mp3",
	"vo/sniper_helpme03.mp3"
}
ENT.SoundTbl_MeleeAttackExtra = {
	"weapons/cbar_hitbod1.wav",
	"weapons/cbar_hitbod2.wav",
	"weapons/cbar_hitbod3.wav",
}
ENT.SoundTbl_MeleeAttackMiss = "weapons/machete_swing.wav"
ENT.SoundTbl_AllyDeath = {
	"vo/sniper_negativevocalization01.mp3",
	"vo/sniper_negativevocalization02.mp3",
	"vo/sniper_negativevocalization03.mp3",
	"vo/sniper_negativevocalization04.mp3",
	"vo/sniper_negativevocalization05.mp3",
	"vo/sniper_negativevocalization06.mp3",
	"vo/sniper_negativevocalization07.mp3",
	"vo/sniper_negativevocalization08.mp3",
	"vo/sniper_negativevocalization09.mp3"
}
ENT.SoundTbl_Pain = {
	"vo/sniper_painsharp01.mp3",
	"vo/sniper_painsharp02.mp3",
	"vo/sniper_painsharp03.mp3",
	"vo/sniper_painsharp04.mp3"
}
ENT.SoundTbl_Death = {
	"vo/sniper_painsevere01.mp3",
	"vo/sniper_painsevere02.mp3",
	"vo/sniper_painsevere03.mp3",
	"vo/sniper_painsevere04.mp3"
}
--------------------
ENT.BeanTF2Zombs_SoundTbl_BattleCry = {
	"vo/sniper_battlecry01.mp3",
	"vo/sniper_battlecry02.mp3",
	"vo/sniper_battlecry03.mp3",
	"vo/sniper_battlecry04.mp3",
	"vo/sniper_battlecry05.mp3",
	"vo/sniper_battlecry06.mp3"
}
ENT.BeanTF2Zombs_SoundTbl_MeleeTaunt = {
	"vo/sniper_meleedare01.mp3",
	"vo/sniper_meleedare02.mp3",
	"vo/sniper_meleedare03.mp3",
	"vo/sniper_meleedare04.mp3",
	"vo/sniper_meleedare05.mp3",
	"vo/sniper_meleedare06.mp3",
	"vo/sniper_meleedare07.mp3",
	"vo/sniper_meleedare08.mp3",
	"vo/sniper_meleedare09.mp3"
}
ENT.BeanTF2Zombs_SoundTbl_GoMove = {
	"vo/sniper_go01.mp3",
	"vo/sniper_go02.mp3",
	"vo/sniper_go03.mp3",
	"vo/sniper_moveup01.mp3",
	"vo/sniper_moveup02.mp3"
}
ENT.BeanTF2Zombs_SoundTbl_Incoming = {
	"vo/sniper_incoming01.mp3",
	"vo/sniper_incoming02.mp3",
	"vo/sniper_incoming03.mp3"
}
ENT.BeanTF2Zombs_SoundTbl_SentryAhead = "vo/sniper_sentryahead01.mp3"
ENT.BeanTF2Zombs_SoundTbl_Pain_Fire = {
	"vo/sniper_autoonfire01.mp3",
	"vo/sniper_autoonfire02.mp3",
	"vo/sniper_autoonfire03.mp3",
}
ENT.BeanTF2Zombs_SoundTbl_Death_Critical = {
	"vo/sniper_paincrticialdeath01.mp3",
	"vo/sniper_paincrticialdeath02.mp3",
	"vo/sniper_paincrticialdeath03.mp3",
	"vo/sniper_paincrticialdeath04.mp3",
}
ENT.BeanTF2Zombs_WeaponAttachment = "effect_hand_r"
ENT.BeanTF2Zombs_SniperMeleeTauntLines = {
	"vo/sniper_specialcompleted28.mp3",
	"vo/sniper_specialcompleted29.mp3",
	"vo/sniper_specialcompleted23.mp3",
	"vo/sniper_specialcompleted31.mp3"
}
--------------------
function ENT:Init()

	self.WeaponModel = ents.Create("prop_physics")
	
	self.WeaponModel:SetModel("models/weapons/c_models/c_machete/c_machete.mdl")
	self.SoundTbl_KilledEnemy = {
		"vo/sniper_specialcompleted06.mp3",
		"vo/sniper_specialcompleted09.mp3"
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

	if self:GetModel() == "models/lazy_zombies_v1/sniper.mdl" then
		self:SetFlexWeight(0,0.25)
		self:SetFlexWeight(1,0.25)
		self:SetFlexWeight(2,0.5)
	end

end
--------------------
function ENT:BeanTF2Zombs_Taunt()

	if math.random(1,5) == 1 then

		self:PlayAnim("vjseq_layer_taunt_laugh", true, 4)
		self.WeaponModel:SetNoDraw(true)
		self:PlaySoundSystem("Speech","vo/sniper_laughlong02.mp3")
		timer.Simple(4,function() if IsValid(self) then
			self.WeaponModel:SetNoDraw(false)
		end end)

	else

		self:PlayAnim("vjseq_melee_taunt", true, 2.5)
		self:PlaySoundSystem("Speech",self.BeanTF2Zombs_SniperMeleeTauntLines)

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
			"vo/sniper_domination1.mp3",
			"vo/sniper_domination2.mp3",
			"vo/sniper_domination3.mp3",
			"vo/sniper_domination4.mp3",
			"vo/sniper_domination5.mp3",
			"vo/sniper_domination6.mp3",
			"vo/sniper_domination7.mp3",
			"vo/sniper_domination8.mp3",
			"vo/sniper_domination9.mp3",
			"vo/sniper_domination10.mp3",
			"vo/sniper_domination11.mp3",
			"vo/sniper_domination12.mp3",
			"vo/sniper_domination13.mp3",
			"vo/sniper_domination14.mp3",
			"vo/sniper_domination15.mp3",
			"vo/sniper_domination16.mp3",
			"vo/sniper_domination17.mp3",
			"vo/sniper_domination18.mp3",
			"vo/sniper_domination19.mp3",
			"vo/sniper_domination20.mp3",
			"vo/sniper_domination21.mp3",
			"vo/sniper_domination22.mp3",
			"vo/sniper_domination23.mp3",
			"vo/sniper_domination24.mp3"
		}
		if BeanTF2Zombs_NPCsConsideredScout[ent:GetClass()] then
			self.SoundTbl_KilledEnemy = {
				"vo/sniper_dominationscout01.mp3",
				"vo/sniper_dominationscout02.mp3",
				"vo/sniper_dominationscout03.mp3",
				"vo/sniper_dominationscout04.mp3",
				"vo/sniper_dominationscout05.mp3"
			}
		elseif BeanTF2Zombs_NPCsConsideredSoldier[ent:GetClass()] then
			self.SoundTbl_KilledEnemy = {
				"vo/sniper_dominationsoldier01.mp3",
				"vo/sniper_dominationsoldier02.mp3",
				"vo/sniper_dominationsoldier03.mp3",
				"vo/sniper_dominationsoldier04.mp3",
				"vo/sniper_dominationsoldier05.mp3",
				"vo/sniper_dominationsoldier06.mp3"
			}
		elseif BeanTF2Zombs_NPCsConsideredPyro[ent:GetClass()] then
			self.SoundTbl_KilledEnemy = {
				"vo/sniper_dominationpyro01.mp3",
				"vo/sniper_dominationpyro02.mp3",
				"vo/sniper_dominationpyro03.mp3",
				"vo/sniper_dominationpyro04.mp3",
				"vo/sniper_dominationpyro05.mp3"
			}
		elseif BeanTF2Zombs_NPCsConsideredDemoman[ent:GetClass()] then
			self.SoundTbl_KilledEnemy = {
				"vo/sniper_dominationdemoman01.mp3",
				"vo/sniper_dominationdemoman02.mp3",
				"vo/sniper_dominationdemoman03.mp3",
				"vo/sniper_dominationdemoman04.mp3",
				"vo/sniper_dominationdemoman05.mp3"
			}
		elseif BeanTF2Zombs_NPCsConsideredHeavy[ent:GetClass()] then
			self.SoundTbl_KilledEnemy = {
				"vo/sniper_dominationheavy01.mp3",
				"vo/sniper_dominationheavy02.mp3",
				"vo/sniper_dominationheavy03.mp3",
				"vo/sniper_dominationheavy04.mp3",
				"vo/sniper_dominationheavy05.mp3",
				"vo/sniper_dominationheavy06.mp3",
				"vo/sniper_dominationheavy07.mp3"
			}
		elseif BeanTF2Zombs_NPCsConsideredEngineer[ent:GetClass()] then
			self.SoundTbl_KilledEnemy = {
				"vo/sniper_dominationengineer01.mp3",
				"vo/sniper_dominationengineer02.mp3",
				"vo/sniper_dominationengineer03.mp3",
				"vo/sniper_dominationengineer04.mp3",
				"vo/sniper_dominationengineer05.mp3",
				"vo/sniper_dominationengineer06.mp3"
			}
		elseif BeanTF2Zombs_NPCsConsideredMedic[ent:GetClass()] then
			self.SoundTbl_KilledEnemy = {
				"vo/sniper_dominationmedic01.mp3",
				"vo/sniper_dominationmedic02.mp3",
				"vo/sniper_dominationmedic03.mp3",
				"vo/sniper_dominationmedic04.mp3",
				"vo/sniper_dominationmedic05.mp3"
			}
		elseif BeanTF2Zombs_NPCsConsideredSniper[ent:GetClass()] then
			self.SoundTbl_KilledEnemy = {
				"vo/sniper_dominationsniper18.mp3",
				"vo/sniper_dominationsniper19.mp3",
				"vo/sniper_dominationsniper20.mp3",
				"vo/sniper_dominationsniper21.mp3",
				"vo/sniper_dominationsniper22.mp3",
				"vo/sniper_dominationsniper12.mp3",
				"vo/sniper_dominationsniper15.mp3",
				"vo/sniper_dominationsniper16.mp3",
				"vo/sniper_dominationsniper17.mp3"
			}
		elseif BeanTF2Zombs_NPCsConsideredSpy[ent:GetClass()] then
			self.SoundTbl_KilledEnemy = {
				"vo/sniper_dominationspy01.mp3",
				"vo/sniper_dominationspy02.mp3",
				"vo/sniper_dominationspy03.mp3",
				"vo/sniper_dominationspy04.mp3",
				"vo/sniper_dominationspy05.mp3",
				"vo/sniper_dominationspy06.mp3",
				"vo/sniper_dominationspy07.mp3"
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