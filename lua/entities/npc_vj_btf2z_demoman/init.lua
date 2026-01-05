include("entities/npc_vj_btf2z_soldier/init.lua")
AddCSLuaFile("shared.lua")
include('shared.lua')
--------------------
ENT.Model = {
	"models/zombies/boneless/hwm/demo.mdl",
	"models/lazy_zombies_v1/demo.mdl"
}
ENT.StartHealth = 175
ENT.ControllerParams = {
	ThirdP_Offset = Vector(20, 0, -30),
	FirstP_Bone = "bip_head",
	FirstP_Offset = Vector(0, 2.5, 0), 
	FirstP_ShrinkBone = true,
}
--------------------
ENT.MeleeAttackDamageType = DMG_CLUB
ENT.AnimTbl_MeleeAttack = "vjges_melee_swing"
-- ENT.MeleeAttackDistance = 45
-- ENT.MeleeAttackDamageDistance = 60
ENT.TimeUntilMeleeAttackDamage = 0.325
-- ENT.NextMeleeAttackTime = 0.8
--------------------
ENT.FootstepSoundTimerWalk = 0.25
ENT.FootstepSoundTimerRun = 0.25
ENT.SoundTbl_ReceiveOrder = {
	"vo/demoman_yes01.mp3",
	"vo/demoman_yes02.mp3",
	"vo/demoman_yes03.mp3"
}
ENT.SoundTbl_MedicReceiveHeal = {
	"vo/demoman_thanksfortheheal01.mp3",
	"vo/demoman_thanksfortheheal02.mp3",
	"vo/demoman_thanksfortheheal03.mp3"
}
ENT.SoundTbl_LostEnemy = false
ENT.SoundTbl_CallForHelp = {
	"vo/demoman_helpme01.mp3",
	"vo/demoman_helpme02.mp3",
	"vo/demoman_helpme03.mp3"
}
ENT.SoundTbl_MeleeAttackExtra = {
	"weapons/bottle_hit_flesh1.wav",
	"weapons/bottle_hit_flesh2.wav",
	"weapons/bottle_hit_flesh3.wav",
}
ENT.SoundTbl_MeleeAttackMiss = "weapons/cbar_miss1.wav"
ENT.SoundTbl_AllyDeath = {
	"vo/demoman_negativevocalization01.mp3",
	"vo/demoman_negativevocalization02.mp3",
	"vo/demoman_negativevocalization03.mp3",
	"vo/demoman_negativevocalization04.mp3",
	"vo/demoman_negativevocalization05.mp3",
	"vo/demoman_negativevocalization06.mp3"
}
ENT.SoundTbl_Pain = {
	"vo/demoman_painsharp01.mp3",
	"vo/demoman_painsharp02.mp3",
	"vo/demoman_painsharp03.mp3",
	"vo/demoman_painsharp04.mp3",
	"vo/demoman_painsharp05.mp3",
	"vo/demoman_painsharp06.mp3",
	"vo/demoman_painsharp07.mp3"
}
ENT.SoundTbl_Death = {
	"vo/demoman_painsevere01.mp3",
	"vo/demoman_painsevere02.mp3",
	"vo/demoman_painsevere03.mp3",
	"vo/demoman_painsevere04.mp3"
}
--------------------
ENT.BeanTF2Zombs_SoundTbl_BattleCry = {
	"vo/demoman_battlecry01.mp3",
	"vo/demoman_battlecry02.mp3",
	"vo/demoman_battlecry03.mp3",
	"vo/demoman_battlecry04.mp3",
	"vo/demoman_battlecry05.mp3",
	"vo/demoman_battlecry06.mp3",
	"vo/demoman_battlecry07.mp3"
}
ENT.BeanTF2Zombs_SoundTbl_MeleeTaunt = {
	"vo/taunts/demoman_taunts03.mp3",
	"vo/taunts/demoman_taunts05.mp3",
	"vo/taunts/demoman_taunts14.mp3"
}
ENT.BeanTF2Zombs_SoundTbl_GoMove = {
	"vo/demoman_go01.mp3",
	"vo/demoman_go02.mp3",
	"vo/demoman_go03.mp3",
	"vo/demoman_moveup01.mp3",
	"vo/demoman_moveup02.mp3",
	"vo/demoman_moveup03.mp3"
}
ENT.BeanTF2Zombs_SoundTbl_Incoming = {
	"vo/demoman_incoming01.mp3",
	"vo/demoman_incoming02.mp3",
	"vo/demoman_incoming03.mp3"
}
ENT.BeanTF2Zombs_SoundTbl_SentryAhead = {
	"vo/demoman_sentryahead01.mp3",
	"vo/demoman_sentryahead02.mp3",
	"vo/demoman_sentryahead03.mp3"
}
ENT.BeanTF2Zombs_SoundTbl_Pain_Fire = {
	"vo/demoman_autoonfire01.mp3",
	"vo/demoman_autoonfire02.mp3",
	"vo/demoman_autoonfire03.mp3"
}
ENT.BeanTF2Zombs_SoundTbl_Death_Critical = {
	"vo/demoman_paincrticialdeath01.mp3",
	"vo/demoman_paincrticialdeath02.mp3",
	"vo/demoman_paincrticialdeath03.mp3",
	"vo/demoman_paincrticialdeath04.mp3",
	"vo/demoman_paincrticialdeath05.mp3"
}
ENT.BeanTF2Zombs_SoundTbl_DemoBurp = {
	"vo/burp04.mp3",
	"vo/burp02.mp3",
	"vo/burp06.mp3"
}
ENT.BeanTF2Zombs_WeaponAttachment = "effect_hand_r"
--------------------
function ENT:Init()

	self.WeaponModel = ents.Create("prop_physics")
	
	self.WeaponModel:SetModel("models/weapons/w_models/w_bottle.mdl")
	self.SoundTbl_KilledEnemy = {
		"vo/demoman_gibberish01.mp3",
		"vo/demoman_gibberish02.mp3",
		"vo/demoman_gibberish04.mp3",
		"vo/demoman_gibberish05.mp3",
		"vo/demoman_gibberish06.mp3",
		"vo/demoman_gibberish07.mp3",
		"vo/demoman_gibberish08.mp3",
		"vo/demoman_gibberish10.mp3",
		"vo/demoman_specialcompleted02.mp3", -- unique to this weapon
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

	if self:GetModel() == "models/lazy_zombies_v1/demo.mdl" then
		self:SetFlexWeight(0,0.25)
		self:SetFlexWeight(1,0.25)
		self:SetFlexWeight(2,0.5)
	end
end
--------------------
function ENT:BeanTF2Zombs_Taunt()

	if specifictaunt == "scaredycat" then

		-- self:PlayAnim("vjseq_layer_taunt_laugh", true, 5)
		-- self:PlayAnim("vjseq_layer_taunt_the_scaredycat_soldier", true, 5)
		self:PlayAnim("vjseq_layer_taunt_the_scaredycat_demoman", true, 5)
		self:PlaySoundSystem("Speech",self.BeanTF2Zombs_SoundTbl_Death_Critical)
		self.WeaponModel:SetNoDraw(true)
		timer.Simple(4,function() if IsValid(self) then
			self:PlaySoundSystem("Speech",self.BeanTF2Zombs_SoundTbl_ScaredyCat)
		end end)
		timer.Simple(5,function() if IsValid(self) then
			self.WeaponModel:SetNoDraw(false)
		end end)

	elseif math.random(1,5) == 1 or specifictaunt == "schadenfreude" then

		self:PlayAnim("vjseq_layer_taunt_laugh", true, 5)
		self.WeaponModel:SetNoDraw(true)
		self:PlaySoundSystem("Speech","vo/demoman_laughlong02.mp3")
		timer.Simple(5,function() if IsValid(self) then
			self.WeaponModel:SetNoDraw(false)
		end end)

	else

		self:PlayAnim("vjseq_layer_taunt03", true, 4)
		self:PlaySoundSystem("Speech","vo/demoman_goodjob01.mp3")
		timer.Simple(3.5,function() if IsValid(self) then
			VJ.EmitSound(self,self.BeanTF2Zombs_SoundTbl_DemoBurp,80,100)
		end end)

	end

end
--------------------
local BeanTF2Zombs_NPCsConsideredBuildings = {
	npc_combine_camera = true,
	npc_cscanner = true,
	npc_manhack = true,
	npc_rollermine = true,
	npc_turret_ceiling = true,
	npc_turret_floor = true,
	npc_vj_hlr1_cturret = true,
	npc_vj_hlr1_cturret_mini = true,
	npc_vj_hlr1_gturret = true,
	npc_vj_hlr1_gturret_mini = true,
	npc_vj_hlr1_sentry = true,
	npc_vj_hlrdc_sentry = true,
	npc_vj_hlr1_xen_cannon = true,
	npc_vj_hlr2_com_sentry = true,
	npc_vj_hlr2_res_sentry = true,
}
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
	if BeanTF2Zombs_NPCsConsideredBuildings[ent:GetClass()] then
		-- i feel like there's a better way to do this but i don't know it
		self.BeanTF2Zombs_OriginalKilledEnemyLines = self.SoundTbl_KilledEnemy
		self.SoundTbl_KilledEnemy = {
			"vo/demoman_specialcompleted11.mp3",
			"vo/demoman_specialcompleted12.mp3"
		}
		timer.Simple(0.1, function() if IsValid(self) then
			self.SoundTbl_KilledEnemy = self.BeanTF2Zombs_OriginalKilledEnemyLines
		end end)
	-- elseif self.BeanTF2Zombs_TotalKills >= 3 then
	elseif math.random(1,3) == 1 then
		self.BeanTF2Zombs_OriginalKilledEnemyLines = self.SoundTbl_KilledEnemy
		self.SoundTbl_KilledEnemy = {
			"vo/demoman_laughshort02.mp3",
			"vo/demoman_laughshort05.mp3",
			"vo/demoman_laughevil01.mp3",
			"vo/demoman_laughevil02.mp3",
			"vo/demoman_laughevil03.mp3",
			"vo/demoman_laughevil04.mp3",
			"vo/demoman_laughevil05.mp3",
			"vo/demoman_cheers05.mp3",
			"vo/demoman_laughlong01.mp3",
			"vo/demoman_laughlong02.mp3",
			"vo/demoman_laughhappy01.mp3",
		}
		if BeanTF2Zombs_NPCsConsideredScout[ent:GetClass()] then
			self.SoundTbl_KilledEnemy = {
				"vo/demoman_dominationscout01.mp3",
				"vo/demoman_dominationscout02.mp3",
				"vo/demoman_dominationscout03.mp3",
				"vo/demoman_dominationscout04.mp3",
				"vo/demoman_dominationscout05.mp3",
				"vo/demoman_dominationscout06.mp3",
				"vo/demoman_dominationscout07.mp3",
				"vo/demoman_dominationscout08.mp3"
			}
		elseif BeanTF2Zombs_NPCsConsideredSoldier[ent:GetClass()] then
			self.SoundTbl_KilledEnemy = {
				"vo/demoman_dominationsoldier01.mp3",
				"vo/demoman_dominationsoldier02.mp3",
				"vo/demoman_dominationsoldier03.mp3",
				"vo/demoman_dominationsoldier04.mp3",
				"vo/demoman_dominationsoldier05.mp3"
			}
		elseif BeanTF2Zombs_NPCsConsideredPyro[ent:GetClass()] then
			self.SoundTbl_KilledEnemy = {
				"vo/demoman_dominationpyro01.mp3",
				"vo/demoman_dominationpyro02.mp3",
				"vo/demoman_dominationpyro03.mp3",
				"vo/demoman_dominationpyro04.mp3",
				"vo/demoman_dominationpyro05.mp3"
			}
		elseif BeanTF2Zombs_NPCsConsideredDemoman[ent:GetClass()] then
			self.SoundTbl_KilledEnemy = {
				"vo/demoman_dominationdemoman01.mp3",
				"vo/demoman_dominationdemoman02.mp3",
				"vo/demoman_dominationdemoman03.mp3",
				"vo/demoman_dominationdemoman04.mp3"
			}
		elseif BeanTF2Zombs_NPCsConsideredHeavy[ent:GetClass()] then
			self.SoundTbl_KilledEnemy = {
				"vo/demoman_dominationheavy01.mp3",
				"vo/demoman_dominationheavy02.mp3",
				"vo/demoman_dominationheavy03.mp3",
				"vo/demoman_dominationheavy04.mp3",
				"vo/demoman_dominationheavy05.mp3"
			}
		elseif BeanTF2Zombs_NPCsConsideredEngineer[ent:GetClass()] then
			self.SoundTbl_KilledEnemy = {
				"vo/demoman_dominationengineer01.mp3",
				"vo/demoman_dominationengineer02.mp3",
				"vo/demoman_dominationengineer03.mp3",
				"vo/demoman_dominationengineer04.mp3",
				"vo/demoman_dominationengineer05.mp3",
				"vo/demoman_dominationengineer06.mp3"
			}
		elseif BeanTF2Zombs_NPCsConsideredMedic[ent:GetClass()] then
			self.SoundTbl_KilledEnemy = {
				"vo/demoman_dominationmedic01.mp3",
				"vo/demoman_dominationmedic02.mp3",
				"vo/demoman_dominationmedic03.mp3",
				"vo/demoman_dominationmedic04.mp3"
			}
		elseif BeanTF2Zombs_NPCsConsideredSniper[ent:GetClass()] then
			self.SoundTbl_KilledEnemy = {
				"vo/demoman_dominationsniper01.mp3",
				"vo/demoman_dominationsniper02.mp3",
				"vo/demoman_dominationsniper03.mp3",
				"vo/demoman_dominationsniper04.mp3"
			}
		elseif BeanTF2Zombs_NPCsConsideredSpy[ent:GetClass()] then
			self.SoundTbl_KilledEnemy = {
				"vo/demoman_dominationspy01.mp3",
				"vo/demoman_dominationspy02.mp3",
				"vo/demoman_dominationspy03.mp3"
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