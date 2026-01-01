include("entities/npc_vj_btf2z_soldier/init.lua")
AddCSLuaFile("shared.lua")
include('shared.lua')
--------------------
ENT.Model = {
	"models/zombies/boneless/hwm/pyro.mdl",
	"models/lazy_zombies_v1/pyro.mdl"
}
ENT.StartHealth = 175
--------------------
ENT.AllowIgnition = false
--------------------
-- ENT.MeleeAttackDamageType = DMG_SLASH
ENT.AnimTbl_MeleeAttack = "vjges_attackstand_melee"
ENT.TimeUntilMeleeAttackDamage = 0.4
--------------------
ENT.SoundTbl_MedicReceiveHeal = "vo/pyro_thanksfortheheal01.mp3"
ENT.SoundTbl_CallForHelp = "vo/pyro_helpme01.mp3"
ENT.SoundTbl_MeleeAttackMiss = "weapons/cbar_miss1.wav"
ENT.SoundTbl_AllyDeath = "vo/pyro_negativevocalization01.mp3"
ENT.SoundTbl_Pain = {
	"vo/pyro_painsharp01.mp3",
	"vo/pyro_painsharp02.mp3",
	"vo/pyro_painsharp03.mp3",
	"vo/pyro_painsharp04.mp3",
	"vo/pyro_painsharp05.mp3",
	"vo/pyro_painsharp06.mp3",
	"vo/pyro_painsharp07.mp3"
}
ENT.SoundTbl_Death = {
	"vo/pyro_painsevere01.mp3",
	"vo/pyro_painsevere02.mp3",
	"vo/pyro_painsevere03.mp3",
	"vo/pyro_painsevere04.mp3",
	"vo/pyro_painsevere05.mp3",
	"vo/pyro_painsevere06.mp3"
}
ENT.SoundTbl_Death_Critical = {
	"vo/pyro_paincrticialdeath01.mp3",
	"vo/pyro_paincrticialdeath02.mp3",
	"vo/pyro_paincrticialdeath03.mp3"
}
--------------------
ENT.SoundTbl_BattleCry = {
	"vo/pyro_battlecry01.mp3",
	"vo/pyro_battlecry02.mp3"
}
ENT.SoundTbl_GoMove = {
	"vo/pyro_go01.mp3",
	"vo/pyro_moveup01.mp3"
}
ENT.SoundTbl_MeleeTaunt = {
	"vo/pyro_specialcompleted01.mp3",
	"vo/pyro_autocappedintelligence01.mp3",
	"vo/pyro_laughevil02.mp3"
}
ENT.SoundTbl_SentryAhead = "vo/pyro_sentryahead01.mp3"
ENT.SoundTbl_Incoming = "vo/pyro_incoming01.mp3"
--------------------
function ENT:Init()

	self.WeaponModel = ents.Create("prop_physics")
	
	self.WeaponModel:SetModel("models/weapons/w_models/w_fireaxe.mdl")
	self.SoundTbl_KilledEnemy = {
		"vo/taunts/pyro_taunts01.mp3",
		"vo/taunts/pyro_taunts02.mp3",
		"vo/taunts/pyro_taunts03.mp3"
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

		self:PlayAnim("vjseq_layer_taunt_laugh", true, 5)
		self.WeaponModel:SetNoDraw(true)
		self:PlaySoundSystem("Speech","vo/pyro_laugh_addl04.mp3")
		timer.Simple(5,function() if IsValid(self) then
			self.WeaponModel:SetNoDraw(false)
		end end)

	else

		self:PlayAnim("vjseq_layer_taunt03", true, 4)
		timer.Simple(0.25,function() if IsValid(self) then
			self:PlaySoundSystem("Speech","player/taunt_rockstar.wav")
		end end)
		timer.Simple(2,function() if IsValid(self) then
			self:PlaySoundSystem("Speech","player/taunt_rockstar_end.wav")
		end end)

	end

end