AddCSLuaFile("shared.lua")
include('shared.lua')
--------------------
ENT.Model = {
	"models/zombies/boneless/hwm/soldier.mdl",
	"models/lazy_zombies_v1/soldier.mdl"
}
ENT.StartHealth = 200
ENT.ControllerParams = {
	ThirdP_Offset = Vector(20, 0, -30),
	FirstP_Bone = "bip_head",
	FirstP_Offset = Vector(0, 0, 0), 
	FirstP_ShrinkBone = true,
}
--------------------
ENT.UsePoseParameterMovement = true
--------------------
ENT.VJ_NPC_Class = {"CLASS_ZOMBIE"}
--------------------
ENT.BloodColor = VJ.BLOOD_COLOR_RED
ENT.BloodDecalUseGMod = true
ENT.BloodParticle = {"tf2_blood_impact_red_01"} -- figure out what the default blood particles are for now, worry about the tf2 ones later
ENT.HasBloodPool = false
ENT.AnimTbl_Flinch = "vjges_a_flinch01"
--------------------
ENT.MeleeAttackDamage = 30 -- original is 65
-- ENT.MeleeAttackDamageType = bit.bor(DMG_CLUB, DMG_SLASH)
ENT.MeleeAttackDamageType = DMG_SLASH
ENT.AnimTbl_MeleeAttack = "vjges_attack_stand_melee"
ENT.MeleeAttackDistance = 70
ENT.MeleeAttackDamageDistance = 60
ENT.TimeUntilMeleeAttackDamage = 0.3
ENT.NextMeleeAttackTime = 0.5
--------------------
ENT.FootstepSoundTimerWalk = 0.3
ENT.FootstepSoundTimerRun = 0.3
ENT.KilledEnemySoundLast = false
ENT.HasExtraMeleeAttackSounds = true
ENT.HasImpactSounds = false
ENT.SoundTbl_FootStep = {
	"player/footsteps/concrete1.wav",
	"player/footsteps/concrete2.wav",
	"player/footsteps/concrete3.wav",
	"player/footsteps/concrete4.wav"
}
ENT.SoundTbl_ReceiveOrder = {
	"vo/soldier_yes01.mp3",
	"vo/soldier_yes02.mp3",
	"vo/soldier_yes03.mp3",
	"vo/soldier_yes04.mp3"
}
-- ENT.SoundTbl_FollowPlayer = false
-- ENT.SoundTbl_UnFollowPlayer = false
-- ENT.SoundTbl_YieldToPlayer = false
ENT.SoundTbl_MedicReceiveHeal = {
	"vo/soldier_thanksfortheheal01.mp3",
	"vo/soldier_thanksfortheheal02.mp3",
	"vo/soldier_thanksfortheheal03.mp3"
}
ENT.SoundTbl_OnPlayerSight = false
ENT.SoundTbl_Investigate = false
ENT.SoundTbl_LostEnemy = false
ENT.SoundTbl_Alert = false
ENT.SoundTbl_CallForHelp = {
	"vo/soldier_helpme01.mp3",
	"vo/soldier_helpme02.mp3",
	"vo/soldier_helpme03.mp3"
}
ENT.SoundTbl_BecomeEnemyToPlayer = false
ENT.SoundTbl_BeforeMeleeAttack = false
ENT.SoundTbl_MeleeAttack = false
ENT.SoundTbl_MeleeAttackExtra = {
	"weapons/axe_hit_flesh1.wav",
	"weapons/axe_hit_flesh2.wav",
	"weapons/axe_hit_flesh3.wav"
}
ENT.SoundTbl_MeleeAttackMiss = "weapons/shovel_swing.wav"
-- ENT.SoundTbl_KilledEnemy = false
ENT.SoundTbl_AllyDeath = {
	"vo/soldier_negativevocalization01.mp3",
	"vo/soldier_negativevocalization02.mp3",
	"vo/soldier_negativevocalization03.mp3",
	"vo/soldier_negativevocalization04.mp3",
	"vo/soldier_negativevocalization05.mp3",
	"vo/soldier_negativevocalization06.mp3"
}
ENT.SoundTbl_Pain = {
	"vo/soldier_painsharp01.mp3",
	"vo/soldier_painsharp02.mp3",
	"vo/soldier_painsharp03.mp3",
	"vo/soldier_painsharp04.mp3",
	"vo/soldier_painsharp05.mp3",
	"vo/soldier_painsharp06.mp3",
	"vo/soldier_painsharp07.mp3",
	"vo/soldier_painsharp08.mp3"
}
-- ENT.SoundTbl_Impact = "VJ.Impact.Flesh_Alien" -- EFFECT
ENT.SoundTbl_DamageByPlayer = false
ENT.SoundTbl_Death = {
	"vo/soldier_painsevere01.mp3",
	"vo/soldier_painsevere02.mp3",
	"vo/soldier_painsevere03.mp3",
	"vo/soldier_painsevere04.mp3",
	"vo/soldier_painsevere05.mp3",
	"vo/soldier_painsevere06.mp3"
}
ENT.PainSoundChance = 1
-- ENT.KilledEnemySoundChance = 3
ENT.KilledEnemySoundChance = 1
ENT.FootstepSoundLevel = 80
ENT.MainSoundPitch = 100
ENT.MainSoundPitchStatic = false
ENT.ExtraMeleeSoundPitch = 100
--------------------
ENT.BeanTF2Zombs_NextFirePainTime = CurTime()
ENT.BeanTF2Zombs_PlayedIgniteSound = false
ENT.BeanTF2Zombs_CanPlayBurningVoiceLine = true
ENT.BeanTF2Zombs_PlayingBurningVoiceLine = false
ENT.BeanTF2Zombs_SoundTbl_BattleCry = {
	"vo/soldier_battlecry01.mp3",
	"vo/soldier_battlecry02.mp3",
	"vo/soldier_battlecry03.mp3",
	"vo/soldier_battlecry04.mp3",
	"vo/soldier_battlecry05.mp3"
}
ENT.BeanTF2Zombs_SoundTbl_MeleeTaunt = {
	"vo/taunts/soldier_taunts03.mp3",
	"vo/taunts/soldier_taunts08.mp3",
	"vo/taunts/soldier_taunts14.mp3",
	"vo/taunts/soldier_taunts16.mp3",
	"vo/taunts/soldier_taunts19.mp3",
	"vo/taunts/soldier_taunts20.mp3",
}
ENT.BeanTF2Zombs_SoundTbl_GoMove = {
	"vo/soldier_go01.mp3",
	"vo/soldier_go02.mp3",
	"vo/soldier_go03.mp3",
	"vo/soldier_moveup01.mp3",
	"vo/soldier_moveup02.mp3",
	"vo/soldier_moveup03.mp3"
}
ENT.BeanTF2Zombs_SoundTbl_Incoming = "vo/soldier_incoming01.mp3"
ENT.BeanTF2Zombs_SoundTbl_SentryAhead = {
	"vo/soldier_sentryahead01.mp3",
	"vo/soldier_sentryahead02.mp3",
	"vo/soldier_sentryahead03.mp3"
}
ENT.BeanTF2Zombs_SoundTbl_Pain_Fire = {
	"vo/soldier_autoonfire01.mp3",
	"vo/soldier_autoonfire02.mp3",
	"vo/soldier_autoonfire03.mp3",
}
ENT.BeanTF2Zombs_SoundTbl_Death_Critical = {
	"vo/soldier_paincrticialdeath01.mp3",
	"vo/soldier_paincrticialdeath02.mp3",
	"vo/soldier_paincrticialdeath03.mp3",
	"vo/soldier_paincrticialdeath04.mp3",
}
ENT.BeanTF2Zombs_SoundTbl_ScaredyCat = {
	"vo/soldier_sf12_scared01.mp3",
	"vo/soldier_mvm_loot_rare01.mp3",
	"vo/soldier_sf13_influx_big02.mp3"
}
ENT.BeanTF2Zombs_NextTauntTime = CurTime()
ENT.BeanTF2Zombs_TotalKills = 0
-- ENT.BeanTF2Zombs_Scared = false
-- ENT.BeanTF2Zombs_FearLevel = 0
ENT.BeanTF2Zombs_WeaponAttachment = "weapon_bone"
--------------------
function ENT:Init()

	self.WeaponModel = ents.Create("prop_physics")
	
	self.WeaponModel:SetModel("models/weapons/w_models/w_shovel.mdl")
	self.SoundTbl_KilledEnemy = {
		"vo/soldier_specialcompleted05.mp3",
		"vo/soldier_directhittaunt01.mp3",
		"vo/soldier_directhittaunt02.mp3",
		"vo/soldier_directhittaunt03.mp3",
		"vo/soldier_directhittaunt04.mp3",
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

	if self:GetModel() == "models/lazy_zombies_v1/soldier.mdl" then
		self:SetFlexWeight(0,0.25)
		self:SetFlexWeight(1,0.25)
		self:SetFlexWeight(2,0.5)
	end

end
--------------------
local BeanTF2Zombs_NPCsConsideredSentries = {
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
local BeanTF2Zombs_ProjectilesForIncoming = {
	prop_combine_ball = true,
	grenade_ar2 = true,
	rpg_missile = true,
	apc_missile = true
}
-----
function ENT:OnThinkActive()

	for k, v in pairs(ents.FindInSphere(self:GetPos() + self:GetForward() * 500, 300)) do
		-- if v:GetClass() == "prop_physics" then
			-- v:SetColor(Color(255,0,0))
		-- end
		if BeanTF2Zombs_ProjectilesForIncoming[v:GetClass()] && self.BeanTF2Zombs_NextTauntTime < CurTime() then
			self.BeanTF2Zombs_NextTauntTime = CurTime() + math.random(5,20)
			if v:GetClass() == "prop_combine_ball" && self:GetClass() == "npc_vj_btf2z_soldier" then
				self:BeanTF2Zombs_Taunt("scaredycat")
			else
				self:PlaySoundSystem("Speech",self.BeanTF2Zombs_SoundTbl_Incoming)
				self:PlayAnim("vjges_gesture_melee_help")
			end
		end
	end

	-- if self.AllowIgnition then
		-- PrintMessage(4,"Piss")
	-- else
		-- PrintMessage(4,"Shit")
	-- end

	if IsValid(self:GetEnemy()) && self.BeanTF2Zombs_NextTauntTime < CurTime() && math.random(1,125) == 1 then
		self.BeanTF2Zombs_NextTauntTime = CurTime() + math.random(5,20)
		if self:GetPos():Distance(self:GetEnemy():GetPos()) <= 300 then
			self:PlaySoundSystem("Speech",self.BeanTF2Zombs_SoundTbl_MeleeTaunt)
			self:PlayAnim("vjges_gesture_melee_cheer")
		elseif BeanTF2Zombs_NPCsConsideredSentries[self:GetEnemy():GetClass()] then
			self:PlaySoundSystem("Speech",self.BeanTF2Zombs_SoundTbl_SentryAhead)
			self:PlayAnim("vjges_gesture_melee_go")
		else
			if math.random(1,2) == 1 then
				self:PlaySoundSystem("Speech",self.BeanTF2Zombs_SoundTbl_GoMove)
				self:PlayAnim("vjges_gesture_melee_go")
			else
				self:PlaySoundSystem("Speech",self.BeanTF2Zombs_SoundTbl_BattleCry)
				self:PlayAnim("vjges_gesture_melee_cheer")
			end
		end
	end

	if self:IsOnFire() && !self.BeanTF2Zombs_PlayedIgniteSound then
		self.BeanTF2Zombs_PlayedIgniteSound = true
		self.BeanTF2Zombs_NextFirePainTime = CurTime() + 3
		VJ.EmitSound(self,"misc/flame_engulf.wav",70,100)
	elseif !self:IsOnFire() && self.BeanTF2Zombs_PlayedIgniteSound then
		self.BeanTF2Zombs_PlayedIgniteSound = false
		self.BeanTF2Zombs_CanPlayBurningVoiceLine = true
	end

end
--------------------
function ENT:OnCallForHelp(ally, isFirst)
	self:PlayAnim("vjges_gesture_melee_help")
end
--------------------
function ENT:BeanTF2Zombs_Taunt(specifictaunt)

	if specifictaunt == "scaredycat" then

		self:PlayAnim("vjseq_layer_taunt_the_scaredycat_soldier", true, 5)
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
		self:PlaySoundSystem("Speech","vo/soldier_laughlong03.mp3")
		timer.Simple(5,function() if IsValid(self) then
			self.WeaponModel:SetNoDraw(false)
		end end)

	else

		self:PlayAnim("vjseq_layer_taunt03", true, 4)
		self:PlaySoundSystem("Speech","vo/soldier_paincrticialdeath0"..math.random(1,4)..".mp3")
		timer.Simple(2.67,function() if IsValid(self) then
			VJ.EmitSound(self,"player/taunt_helmet_hit.wav",80,100)
		end end)
		timer.Simple(3,function() if IsValid(self) then
			VJ.EmitSound(self,"player/taunt_helmet_hit.wav",80,100)
		end end)
		timer.Simple(3.4,function() if IsValid(self) then
			VJ.EmitSound(self,"player/taunt_helmet_hit.wav",80,100)
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

	if BeanTF2Zombs_NPCsConsideredBuildings[ent:GetClass()] then
		-- i feel like there's a better way to do this but i don't know it
		self.BeanTF2Zombs_OriginalKilledEnemyLines = self.SoundTbl_KilledEnemy
		self.SoundTbl_KilledEnemy = {
			"vo/soldier_battlecry01.mp3",
			"vo/soldier_battlecry02.mp3",
			"vo/soldier_specialcompleted04.mp3",
			"vo/soldier_positivevocalization02.mp3",
			"vo/soldier_positivevocalization01.mp3"
		}
		timer.Simple(0.1, function() if IsValid(self) then
			self.SoundTbl_KilledEnemy = self.BeanTF2Zombs_OriginalKilledEnemyLines
		end end)
	-- elseif self.BeanTF2Zombs_TotalKills >= 3 then
	elseif math.random(1,3) == 1 then
		self.BeanTF2Zombs_OriginalKilledEnemyLines = self.SoundTbl_KilledEnemy
		self.SoundTbl_KilledEnemy = {
			"vo/soldier_laughevil01.mp3",
			"vo/soldier_laughevil02.mp3",
			"vo/soldier_laughevil03.mp3",
			"vo/soldier_laughhappy01.mp3",
			"vo/soldier_laughhappy02.mp3",
			"vo/soldier_laughhappy03.mp3",
			"vo/soldier_laughlong01.mp3",
			"vo/soldier_laughlong03.mp3",
			"vo/taunts/soldier_taunts07.mp3",
			"vo/taunts/soldier_taunts13.mp3"
		}
		if BeanTF2Zombs_NPCsConsideredScout[ent:GetClass()] then
			self.SoundTbl_KilledEnemy = {
				"vo/soldier_dominationscout01.mp3",
				"vo/soldier_dominationscout02.mp3",
				"vo/soldier_dominationscout03.mp3",
				"vo/soldier_dominationscout04.mp3",
				-- "vo/soldier_dominationscout05.mp3",
				-- "vo/soldier_dominationscout06.mp3",
				"vo/soldier_dominationscout07.mp3",
				-- "vo/soldier_dominationscout08.mp3",
				"vo/soldier_dominationscout09.mp3",
				"vo/soldier_dominationscout10.mp3",
				"vo/soldier_dominationscout11.mp3"
			}
		elseif BeanTF2Zombs_NPCsConsideredSoldier[ent:GetClass()] then
			self.SoundTbl_KilledEnemy = {
				"vo/soldier_dominationsoldier01.mp3",
				"vo/soldier_dominationsoldier02.mp3",
				"vo/soldier_dominationsoldier03.mp3",
				"vo/soldier_dominationsoldier04.mp3",
				"vo/soldier_dominationsoldier05.mp3",
				"vo/soldier_dominationsoldier06.mp3"
			}
		elseif BeanTF2Zombs_NPCsConsideredPyro[ent:GetClass()] then
			self.SoundTbl_KilledEnemy = {
				"vo/soldier_dominationpyro01.mp3",
				"vo/soldier_dominationpyro02.mp3",
				"vo/soldier_dominationpyro03.mp3",
				"vo/soldier_dominationpyro04.mp3",
				"vo/soldier_dominationpyro05.mp3",
				"vo/soldier_dominationpyro06.mp3",
				"vo/soldier_dominationpyro07.mp3",
				"vo/soldier_dominationpyro08.mp3",
				"vo/soldier_dominationpyro09.mp3"
			}
		elseif BeanTF2Zombs_NPCsConsideredDemoman[ent:GetClass()] then
			self.SoundTbl_KilledEnemy = {
				"vo/soldier_dominationdemoman01.mp3",
				"vo/soldier_dominationdemoman02.mp3",
				"vo/soldier_dominationdemoman03.mp3",
				"vo/soldier_dominationdemoman04.mp3",
				"vo/soldier_dominationdemoman05.mp3",
				"vo/soldier_dominationdemoman06.mp3"
			}
		elseif BeanTF2Zombs_NPCsConsideredHeavy[ent:GetClass()] then
			self.SoundTbl_KilledEnemy = {
				"vo/soldier_dominationheavy01.mp3",
				"vo/soldier_dominationheavy02.mp3",
				"vo/soldier_dominationheavy03.mp3",
				"vo/soldier_dominationheavy04.mp3",
				"vo/soldier_dominationheavy05.mp3",
				"vo/soldier_dominationheavy06.mp3",
				"vo/soldier_dominationheavy07.mp3"
			}
		elseif BeanTF2Zombs_NPCsConsideredEngineer[ent:GetClass()] then
			self.SoundTbl_KilledEnemy = {
				"vo/soldier_dominationengineer01.mp3",
				"vo/soldier_dominationengineer02.mp3",
				"vo/soldier_dominationengineer03.mp3",
				"vo/soldier_dominationengineer04.mp3",
				"vo/soldier_dominationengineer05.mp3",
				"vo/soldier_dominationengineer06.mp3"
			}
		elseif BeanTF2Zombs_NPCsConsideredMedic[ent:GetClass()] then
			self.SoundTbl_KilledEnemy = {
				"vo/soldier_dominationmedic01.mp3",
				"vo/soldier_dominationmedic02.mp3",
				"vo/soldier_dominationmedic03.mp3",
				"vo/soldier_dominationmedic04.mp3",
				"vo/soldier_dominationmedic05.mp3",
				"vo/soldier_dominationmedic06.mp3",
				"vo/soldier_dominationmedic07.mp3"
			}
		elseif BeanTF2Zombs_NPCsConsideredSniper[ent:GetClass()] then
			self.SoundTbl_KilledEnemy = {
				"vo/soldier_dominationsniper01.mp3",
				"vo/soldier_dominationsniper02.mp3",
				"vo/soldier_dominationsniper03.mp3",
				"vo/soldier_dominationsniper04.mp3",
				"vo/soldier_dominationsniper05.mp3",
				"vo/soldier_dominationsniper06.mp3",
				"vo/soldier_dominationsniper07.mp3",
				"vo/soldier_dominationsniper08.mp3",
				"vo/soldier_dominationsniper09.mp3",
				"vo/soldier_dominationsniper10.mp3",
				"vo/soldier_dominationsniper11.mp3",
				"vo/soldier_dominationsniper12.mp3",
				"vo/soldier_dominationsniper13.mp3",
				"vo/soldier_dominationsniper14.mp3"
			}
		elseif BeanTF2Zombs_NPCsConsideredSpy[ent:GetClass()] then
			self.SoundTbl_KilledEnemy = {
				"vo/soldier_dominationspy01.mp3",
				"vo/soldier_dominationspy02.mp3",
				"vo/soldier_dominationspy03.mp3",
				"vo/soldier_dominationspy04.mp3",
				"vo/soldier_dominationspy05.mp3",
				"vo/soldier_dominationspy06.mp3",
				"vo/soldier_dominationspy07.mp3",
				"vo/soldier_dominationspy08.mp3"
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
--------------------
function ENT:OnDamaged(dmginfo, hitgroup, status)

	-- if math.random(1,4) == 1 && !self.BeanTF2Zombs_Scared then
		-- self.BeanTF2Zombs_Scared = true
		-- self.WeaponModel:SetNoDraw(true)
		-- ParticleEffectAttach("yikes_fx",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("head"))
		-- VJ.EmitSound(self,"vo/halloween_scream"..math.random(1,8)..".mp3",80,100)
	-- end

	if self:IsOnFire() && self.BeanTF2Zombs_NextFirePainTime < CurTime() && self.BeanTF2Zombs_CanPlayBurningVoiceLine && self.HasPainSounds && self:GetClass() != "npc_vj_btf2z_pyro" then
		self.BeanTF2Zombs_CanPlayBurningVoiceLine = false
		self.BeanTF2Zombs_PlayingBurningVoiceLine = true
		self:PlaySoundSystem("Pain",self.BeanTF2Zombs_SoundTbl_Pain_Fire)
		timer.Simple(0.1,function() if IsValid(self) then
			self.HasPainSounds = false
		end end)
		timer.Simple(3,function() if IsValid(self) then
			self.BeanTF2Zombs_PlayingBurningVoiceLine = false
			self.HasPainSounds = true
		end end)
	else
		if self.HasPainSounds && !self.BeanTF2Zombs_PlayingBurningVoiceLine then
			if dmginfo:GetDamage() > 35 then
				self:PlaySoundSystem("Pain",self.SoundTbl_Death)
			end
			timer.Simple(0.0001,function() if IsValid(self) then
				self:PlayAnim(self.AnimTbl_Flinch)
				self.HasPainSounds = false
			end end)
			timer.Simple(0.465,function() if IsValid(self) then
				self.HasPainSounds = true
			end end)
		end
	end

end
--------------------
function ENT:OnDeath(dmginfo, hitgroup, status)

	-- PrintMessage(4,"damage was "..dmginfo:GetDamage().."")

	if status == "Init" then

		if IsValid(self.WeaponModel) then
			if self.BeanTF2Zombs_WeaponAttachment == "effect_hand_r" then
				self:CreateGibEntity("prop_physics",self.WeaponModel:GetModel(),{Pos=self:GetAttachment(self:LookupAttachment("effect_hand_r")).Pos,Ang=self:GetAngles()})
			else
				self:CreateGibEntity("prop_physics",self.WeaponModel:GetModel(),{Pos=self:GetAttachment(self:LookupAttachment("weapon_bone")).Pos,Ang=self:GetAngles()})
			end
			self.WeaponModel:Remove()
		end

		if dmginfo:GetDamage() >= 80 or dmginfo:IsDamageType(DMG_CLUB + DMG_SLASH + DMG_CRUSH) then
			self.SoundTbl_Death = self.BeanTF2Zombs_SoundTbl_Death_Critical
		end

		if self:IsOnFire() && math.random(1,3) == 1 then
			self.HasDeathAnimation = true
			self.AnimTbl_Death = "vjseq_primary_death_burning"
			ParticleEffectAttach("fire_medium_03",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("origin"))
		end

		-- if (dmginfo:GetAttacker():GetForward():Dot((self:GetPos() -dmginfo:GetAttacker():GetPos()):GetNormalized()) > math.cos(math.rad(60))) then
			-- self.HasDeathAnimation = true
			-- self.AnimTbl_Death = "vjseq_primary_death_backstab"
		-- end
		-- this check passes if
		-- - The attacker is a Player, NPC, or NextBot
		-- - The attacker is behind us
		-- - The attacker is aiming at us
		-- - The attacker did CLUB, SLASH, or CRUSH damage
		-- - A 1 in 2 chance passes

		if
			(dmginfo:GetAttacker():IsPlayer() or dmginfo:GetAttacker():IsNPC() or dmginfo:GetAttacker():IsNextBot())
		&&
			(dmginfo:GetAttacker():GetForward():Dot((self:GetPos() -dmginfo:GetAttacker():GetPos()):GetNormalized()) > math.cos(math.rad(60)))
		&&
			dmginfo:GetAttacker():GetAimVector():Dot(self:GetForward()) > 0.5 -- took this bit from vrej's nmrih pack pls don't castrate me
		&&
			dmginfo:IsDamageType(DMG_CLUB + DMG_SLASH + DMG_CRUSH)
		&&
			math.random(1,2) == 1
		then
			self.HasDeathAnimation = true
			self.AnimTbl_Death = "vjseq_primary_death_backstab"
		end

		if hitgroup == HITGROUP_HEAD && dmginfo:GetDamage() >= 80 && math.random(1,3) == 1 then
			self.HasDeathAnimation = true
			self.AnimTbl_Death = "vjseq_primary_death_headshot"
		end

		if dmginfo:IsDamageType(DMG_DISSOLVE) then -- expand this to include more energy-type damages?
			self.HasDeathAnimation = true
			self.AnimTbl_Death = "vjseq_dieviolent"
			self.SoundTbl_Death = "player/dissolve.wav"
		end

	end

end
--------------------
-- function ENT:OnInput(key, activator, caller, data)

	-- if key == "step" && self:GetMaterial() != "hud/killicons/default" then
        -- self:PlayFootstepSound()
		-- VJ.EmitSound(self,"roach/ds1/d_foliage/c2330-foot"..math.random(1,3)..".wav.mp3",55,math.random(80,90))
	-- elseif key == "attack" or key == "attack_double" then
        -- self:ExecuteMeleeAttack()
	-- end

-- end
--------------------
-- function ENT:Controller_Initialize(ply, controlEnt)
	-- ply:ChatPrint("MOUSE2: Dig")
	-- timer.Simple(0.1, function() if IsValid(self) then
		-- self.BLBOH_Wretch_TauntCooldown = CurTime() - 15
	-- end end)
-- end
--------------------
function ENT:TranslateActivity(act)
	if act == ACT_RUN || act == ACT_WALK then
		-- if self.BeanTF2Zombs_Scared then
			-- return ACT_MP_RUN_LOSERSTATE
		-- else
			return ACT_MP_RUN_MELEE
		-- end
	elseif act == ACT_IDLE then
		-- if self.BeanTF2Zombs_Scared then
			-- return ACT_MP_STAND_LOSERSTATE
		-- else
			return ACT_MP_STAND_MELEE
		-- end
	elseif act == ACT_JUMP then
		return ACT_MP_JUMP_START_PRIMARY -- couldn't find the melee one
	elseif act == ACT_GLIDE then
		return ACT_MP_AIRWALK_MELEE
	end
	return act
end