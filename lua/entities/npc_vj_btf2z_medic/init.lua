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
ENT.ControllerParams = {
	ThirdP_Offset = Vector(20, 0, -30),
	FirstP_Bone = "bip_head",
	FirstP_Offset = Vector(0, 0, 0), 
	FirstP_ShrinkBone = true,
}
--------------------
ENT.MeleeAttackDamageType = DMG_SLASH
ENT.AnimTbl_MeleeAttack = "vjges_layer_melee_swing"
-- ENT.MeleeAttackDistance = 45
-- ENT.MeleeAttackDamageDistance = 60
-- ENT.TimeUntilMeleeAttackDamage = 0.2
-- ENT.NextMeleeAttackTime = 0.8
--------------------
ENT.FootstepSoundTimerWalk = 0.25
ENT.FootstepSoundTimerRun = 0.25
ENT.SoundTbl_ReceiveOrder = {
	"vo/medic_yes01.mp3",
	"vo/medic_yes02.mp3",
	"vo/medic_yes03.mp3"
}
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
ENT.SoundTbl_Death = {
	"vo/medic_painsevere01.mp3",
	"vo/medic_painsevere02.mp3",
	"vo/medic_painsevere03.mp3",
	"vo/medic_painsevere04.mp3"
}
--------------------
ENT.BeanTF2Zombs_SoundTbl_BattleCry = {
	"vo/medic_battlecry01.mp3",
	"vo/medic_battlecry02.mp3",
	"vo/medic_battlecry03.mp3",
	"vo/medic_battlecry04.mp3",
	"vo/medic_battlecry05.mp3",
	"vo/medic_battlecry06.mp3"
}
ENT.BeanTF2Zombs_SoundTbl_MeleeTaunt = {
	"vo/taunts/medic_taunts01.mp3",
	"vo/taunts/medic_taunts04.mp3",
	"vo/taunts/medic_taunts05.mp3",
	"vo/taunts/medic_taunts06.mp3",
	"vo/taunts/medic_taunts10.mp3",
	"vo/taunts/medic_taunts12.mp3",
	"vo/taunts/medic_taunts13.mp3",
	"vo/taunts/medic_taunts15.mp3"
}
ENT.BeanTF2Zombs_SoundTbl_GoMove = {
	"vo/medic_go01.mp3",
	"vo/medic_go02.mp3",
	"vo/medic_go03.mp3",
	"vo/medic_go04.mp3",
	"vo/medic_moveup01.mp3",
	"vo/medic_moveup02.mp3"
}
ENT.BeanTF2Zombs_SoundTbl_Incoming = {
	"vo/medic_incoming01.mp3",
	"vo/medic_incoming02.mp3",
	"vo/medic_incoming03.mp3"
}
ENT.BeanTF2Zombs_SoundTbl_SentryAhead = {
	"vo/medic_sentryahead01.mp3",
	"vo/medic_sentryahead02.mp3"
}
ENT.BeanTF2Zombs_SoundTbl_Pain_Fire = {
	"vo/medic_autoonfire01.mp3",
	"vo/medic_autoonfire02.mp3",
	"vo/medic_autoonfire03.mp3",
	"vo/medic_autoonfire04.mp3",
	"vo/medic_autoonfire05.mp3"
}
ENT.BeanTF2Zombs_SoundTbl_Death_Critical = {
	"vo/medic_paincrticialdeath01.mp3",
	"vo/medic_paincrticialdeath02.mp3",
	"vo/medic_paincrticialdeath03.mp3",
	"vo/medic_paincrticialdeath04.mp3"
}
ENT.BeanTF2Zombs_SoundTbl_BonesawTauntSounds = {
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
		"vo/taunts/medic_taunts02.mp3",
		"vo/medic_specialcompleted12.mp3",
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
			VJ.EmitSound(self,self.BeanTF2Zombs_SoundTbl_BonesawTauntSounds,80,100)
		end end)

	end

end
--------------------
function ENT:OnKilledEnemy(ent, inflictor, wasLast)

	-- self.BeanTF2Zombs_TotalKills = self.BeanTF2Zombs_TotalKills + 1

	-- if math.random(1,1) == 1 && (!IsValid(self:GetEnemy()) or (IsValid(self:GetEnemy()) && (self:GetPos():Distance(self:GetEnemy():GetPos()) >= 500 or !self:GetEnemy().VJ_ID_Living))) then
	if math.random(1,3) == 1 then
		self.BeanTF2Zombs_OriginalKilledEnemyLines = self.SoundTbl_KilledEnemy
		self.SoundTbl_KilledEnemy = {
			"vo/taunts/medic_taunts14.mp3",
			"vo/taunts/medic_taunts12.mp3",
			"vo/medic_laughlong01.mp3",
			"vo/medic_laughlong02.mp3",
			"vo/medic_laughhappy01.mp3",
			"vo/medic_laughhappy02.mp3",
			"vo/medic_laughhappy03.mp3",
			"vo/medic_laughevil02.mp3",
			"vo/medic_laughevil05.mp3",
			"vo/medic_laughshort03.mp3"
		}
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