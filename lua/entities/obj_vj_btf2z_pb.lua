AddCSLuaFile()

ENT.Base 			= "base_entity"
ENT.Type 			= "ai"
ENT.PrintName 		= "Pumpkin Bomb"
ENT.Author 			= "An average Beanmann"
ENT.Contact 		= ""
ENT.Information 	= "Allan please add details.\n"
ENT.Category		= "TF2 Zombies"

function ENT:Draw() self:DrawModel() end
function ENT:DrawTranslucent() self:Draw() end
--------------------
if !SERVER then return end
--------------------
function ENT:Initialize()
	self:SetModel("models/props_halloween/pumpkin_explode.mdl")
	self:SetMoveType(MOVETYPE_FLY)
	self:SetSolid(SOLID_BBOX)
	self:AddFlags(FL_NOTARGET)
end
--------------------
function ENT:OnTakeDamage(dmginfo)

	-- self:CreateGibEntity("prop_physics","models/props_halloween/pumpkin_explode_jib01.mdl",{Pos=self:GetPos(),Ang=self:GetAngles()})
	VJ.ApplyRadiusDamage(self, self, self:GetPos(), 300, 150, DMG_BLAST, false, true, {Force = 100})
	ParticleEffect("halloween_explosion",self:GetPos(),Angle(0,0,0))
	self:EmitSound("items/pumpkin_explode"..math.random(1,3)..".wav",100)
	self:Remove()

end