include("entities/npc_vj_btf2z_soldier/init.lua")
AddCSLuaFile("shared.lua")
include('shared.lua')
--------------------
ENT.Model = {
	"models/zombies/boneless/hwm/heavy.mdl",
	"models/lazy_zombies_v1/heavy.mdl"
}
ENT.StartHealth = 300
ENT.ControllerParams = {
	ThirdP_Offset = Vector(20, 0, -30),
	FirstP_Bone = "bip_head",
	FirstP_Offset = Vector(10, 0, 0), 
	FirstP_ShrinkBone = true,
}
--------------------
ENT.AnimTbl_Flinch = "vjges_melee_allclass_flinch"
--------------------
ENT.MeleeAttackDamageType = DMG_CLUB
ENT.AnimTbl_MeleeAttack = {
	"vjges_attackstand_melee_l",
	"vjges_attackstand_melee_r"
}
-- ENT.MeleeAttackDistance = 45
-- ENT.MeleeAttackDamageDistance = 60
ENT.TimeUntilMeleeAttackDamage = 0.2
-- ENT.NextMeleeAttackTime = 0.8
--------------------
ENT.FootstepSoundTimerWalk = 0.23
ENT.FootstepSoundTimerRun = 0.23
ENT.SoundTbl_ReceiveOrder = {
	"vo/heavy_yes01.mp3",
	"vo/heavy_yes02.mp3",
	"vo/heavy_yes03.mp3"
}
ENT.SoundTbl_MedicReceiveHeal = {
	"vo/soldier_thanksfortheheal01.mp3",
	"vo/soldier_thanksfortheheal02.mp3",
	"vo/soldier_thanksfortheheal03.mp3"
}
ENT.SoundTbl_CallForHelp = {
	"vo/heavy_helpme01.mp3",
	"vo/heavy_helpme02.mp3",
	"vo/heavy_helpme03.mp3"
}
-- ENT.SoundTbl_BeforeMeleeAttack = false
ENT.SoundTbl_MeleeAttackExtra = {
	"weapons/cbar_hitbod1.wav",
	"weapons/cbar_hitbod2.wav",
	"weapons/cbar_hitbod3.wav",
}
ENT.SoundTbl_MeleeAttackMiss = {
	"weapons/bat_draw_swoosh1.wav",
	"weapons/bat_draw_swoosh2.wav"
}
ENT.SoundTbl_AllyDeath = {
	"vo/heavy_negativevocalization01.mp3",
	"vo/heavy_negativevocalization02.mp3",
	"vo/heavy_negativevocalization03.mp3",
	"vo/heavy_negativevocalization04.mp3",
	"vo/heavy_negativevocalization05.mp3",
	"vo/heavy_negativevocalization06.mp3"
}
ENT.SoundTbl_Pain = {
	"vo/heavy_painsharp01.mp3",
	"vo/heavy_painsharp02.mp3",
	"vo/heavy_painsharp03.mp3",
	"vo/heavy_painsharp04.mp3",
	"vo/heavy_painsharp05.mp3"
}
ENT.SoundTbl_Death = {
	"vo/heavy_painsevere01.mp3",
	"vo/heavy_painsevere02.mp3",
	"vo/heavy_painsevere03.mp3"
}
--------------------
ENT.BeanTF2Zombs_SoundTbl_BattleCry = {
	"vo/heavy_battlecry01.mp3",
	"vo/heavy_battlecry02.mp3",
	"vo/heavy_battlecry03.mp3",
	"vo/heavy_battlecry04.mp3",
	"vo/heavy_battlecry05.mp3",
	"vo/heavy_battlecry06.mp3"
}
ENT.BeanTF2Zombs_SoundTbl_MeleeTaunt = {
	"vo/heavy_meleedare01.mp3",
	"vo/heavy_meleedare02.mp3",
	"vo/heavy_meleedare03.mp3",
	"vo/heavy_meleedare04.mp3",
	"vo/heavy_meleedare05.mp3",
	"vo/heavy_meleedare06.mp3",
	"vo/heavy_meleedare07.mp3",
	"vo/heavy_meleedare08.mp3",
	"vo/heavy_meleedare09.mp3",
	"vo/heavy_meleedare10.mp3",
	"vo/heavy_meleedare11.mp3",
	"vo/heavy_meleedare12.mp3",
	"vo/heavy_meleedare13.mp3",
}
ENT.BeanTF2Zombs_SoundTbl_GoMove = {
	"vo/heavy_go01.mp3",
	"vo/heavy_go02.mp3",
	"vo/heavy_go03.mp3",
	"vo/heavy_moveup01.mp3",
	"vo/heavy_moveup02.mp3",
	"vo/heavy_moveup03.mp3"
}
ENT.BeanTF2Zombs_SoundTbl_Incoming = {
	"vo/heavy_incoming01.mp3",
	"vo/heavy_incoming02.mp3",
	"vo/heavy_incoming03.mp3"
}
ENT.BeanTF2Zombs_SoundTbl_SentryAhead = {
	"vo/heavy_sentryahead01.mp3",
	"vo/heavy_sentryahead02.mp3"
}
ENT.BeanTF2Zombs_SoundTbl_Pain_Fire = {
	"vo/heavy_autoonfire01.mp3",
	"vo/heavy_autoonfire02.mp3",
	"vo/heavy_autoonfire03.mp3",
	"vo/heavy_autoonfire04.mp3",
	"vo/heavy_autoonfire05.mp3",
}
ENT.BeanTF2Zombs_SoundTbl_Death_Critical = {
	"vo/heavy_paincrticialdeath01.mp3",
	"vo/heavy_paincrticialdeath02.mp3",
	"vo/heavy_paincrticialdeath03.mp3"
}
ENT.BeanTF2Zombs_WeaponAttachment = nil
--------------------
function ENT:Init()

	-- self.WeaponModel = ents.Create("prop_physics")
	
	-- no need for weaponmodel for now
	-- self.WeaponModel:SetModel("models/weapons/w_models/w_shovel.mdl")
	self.SoundTbl_KilledEnemy = {
		"vo/heavy_laughshort01.mp3",
		"vo/heavy_laughshort02.mp3",
	}

	-- self.WeaponModel:SetLocalPos(self:GetPos())
	-- self.WeaponModel:SetLocalAngles(self:GetAngles())			
	-- self.WeaponModel:SetOwner(self)
	-- self.WeaponModel:SetParent(self)
	-- self.WeaponModel:Fire("SetParentAttachment","weapon_bone")
	-- self.WeaponModel:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
	-- self.WeaponModel:Spawn()
	-- self.WeaponModel:Activate()
	-- self.WeaponModel:SetSolid(SOLID_NONE)
	-- self.WeaponModel:AddEffects(EF_BONEMERGE)

	if math.random(1,2) == 1 then
		self:SetSkin(1)
	end

	if self:GetModel() == "models/lazy_zombies_v1/heavy.mdl" then
		self:SetFlexWeight(2,0.25)
		self:SetFlexWeight(3,0.25)
		self:SetFlexWeight(4,0.5)
	end

end
--------------------
function ENT:BeanTF2Zombs_Taunt()

	if math.random(1,5) == 1 then

		self:PlayAnim("vjseq_layer_taunt_laugh", true, 5)
		self.WeaponModel:SetNoDraw(true)
		self:PlaySoundSystem("Speech","vo/heavy_laugherbigsnort01.mp3")
		timer.Simple(5,function() if IsValid(self) then
			self.WeaponModel:SetNoDraw(false)
		end end)

	else

		self:PlayAnim("vjseq_layer_taunt03", true, 4)
		timer.Simple(1.5,function() if IsValid(self) then
			self:PlaySoundSystem("Speech","vo/heavy_niceshot02.mp3")
		end end)
		-- timer.Simple(3.4,function() if IsValid(self) then
			-- VJ.EmitSound(self,"player/taunt_helmet_hit.wav",80,100)
		-- end end)

	end

end
--------------------
function ENT:OnKilledEnemy(ent, inflictor, wasLast)

	-- self.BeanTF2Zombs_TotalKills = self.BeanTF2Zombs_TotalKills + 1

	-- if math.random(1,1) == 1 && (!IsValid(self:GetEnemy()) or (IsValid(self:GetEnemy()) && (self:GetPos():Distance(self:GetEnemy():GetPos()) >= 500 or !self:GetEnemy().VJ_ID_Living))) then
	if math.random(1,3) == 1 then
		self.BeanTF2Zombs_OriginalKilledEnemyLines = self.SoundTbl_KilledEnemy
		self.SoundTbl_KilledEnemy = {
			"vo/taunts/heavy_taunts12.mp3",
			"vo/heavy_laugherbig02.mp3",
			"vo/heavy_laugherbig03.mp3",
			"vo/heavy_laugherhappy01.mp3",
			"vo/heavy_laugherhappy02.mp3",
			"vo/heavy_laugherhappy03.mp3",
			"vo/heavy_laugherhappy04.mp3",
			"vo/heavy_laugherhappy05.mp3",
			"vo/heavy_domination01.mp3",
			"vo/heavy_domination02.mp3",
			"vo/heavy_domination03.mp3",
			"vo/heavy_domination04.mp3",
			"vo/heavy_domination05.mp3",
			"vo/heavy_domination06.mp3",
			"vo/heavy_domination07.mp3",
			"vo/heavy_domination08.mp3",
			"vo/heavy_domination09.mp3",
			"vo/heavy_domination12.mp3",
			"vo/heavy_domination13.mp3",
			"vo/heavy_domination14.mp3",
			"vo/heavy_domination15.mp3",
			"vo/heavy_domination16.mp3",
			"vo/heavy_domination17.mp3",
			"vo/heavy_domination18.mp3",
			"vo/heavy_goodjob02.mp3",
			"vo/heavy_jeers06.mp3",
			"vo/heavy_laughevil01.mp3",
			"vo/heavy_laughlong01.mp3",
			"vo/heavy_laughlong02.mp3",
			"vo/heavy_positivevocalization01.mp3",
			"vo/heavy_positivevocalization02.mp3"
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