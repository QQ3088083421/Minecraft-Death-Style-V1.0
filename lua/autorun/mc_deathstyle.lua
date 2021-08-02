
CreateClientConVar("mcdeath","1",true,false,"1=Enable,else disable")
--CreateClientConVar("mcda_npc","0",true,false,"Count NPC in? 1=Yes, 2=Allow NPC kill NPC Announce")

--Minecraft-Style Death, MCSD
MC_HurtColor=Color(255,190,190)
hook.Add("Think","MCSD",function()
if GetConVarNumber("mcdeath")!=1 then return end
if VJBASE_GETNAME then
for _,r in pairs(ents.FindByClass("prop_ragdoll"))do
if !r._MCSD then
r._MCSD=1
if r.IsVJBaseCorpse then
r:SetColor(MC_HurtColor)
timer.Simple(1,function()if IsValid(r)then
for i=1,r:GetBoneCount()do
if isvector(r:GetBonePosition(i))then
local e=EffectData()e:SetOrigin(r:GetBonePosition(i))util.Effect("mcsd_dust",e)end end
SafeRemoveEntity(r)end end)
end
end
end
end
for _,r in pairs(ents.FindByClass("class C_ClientRagdoll"))do
if !r._MCSD then
r._MCSD=1
local v=r:GetRagdollOwner()
if IsValid(v)and(v:IsNPC()||v.loco)then
r:SetColor(MC_HurtColor)
timer.Simple(1,function()if IsValid(r)then
for i=1,r:GetBoneCount()do
if isvector(r:GetBonePosition(i))and math.random(3)<2 then
local e=EffectData()e:SetOrigin(r:GetBonePosition(i)+VectorRand()*math.Rand(0,19))util.Effect("mcsd_dust",e)end end
SafeRemoveEntity(r)end end)
end
end
end
end)

hook.Add("PlayerDeath","MCSD",function(v)
if GetConVarNumber("mcdeath")!=1 then return end
if util.IsValidRagdoll(v:GetModel())then
if v:IsPlayer()and IsValid(v:GetRagdollEntity())then
local r=v:GetRagdollEntity()
r:SetColor(MC_HurtColor)
timer.Simple(1,function()if IsValid(r)then
for i=1,r:GetBoneCount()do
if isvector(r:GetBonePosition(i))and math.random(3)<2 then
local e=EffectData()e:SetOrigin(r:GetBonePosition(i)+VectorRand()*math.Rand(0,19))util.Effect("mcsd_dust",e)end end
SafeRemoveEntity(r)end end)
end
end
end)
