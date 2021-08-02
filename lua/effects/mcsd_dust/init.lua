function EFFECT:Init(data)
	local p=data:GetOrigin()
	local m=ParticleEmitter(p)
	local a=math.random(3,5)
	local t=math.Rand(.5,1)
			local e=m:Add("particles/minecraft/smoke"..a,p+Vector(0,0,8))
			if e then
			local v=VectorRand()*10
			v.z=math.Rand(-10,5)
				e:SetVelocity(v)
				e:SetLifeTime(0)
				e:SetDieTime(t*(a+1))local s=math.random(2,5)*4
				e:SetStartSize(s)
				e:SetEndSize(s)
				e:SetGravity(Vector(0,0,math.Rand(12,18)-a*2))
				e:SetStartAlpha(255)
				e:SetEndAlpha(255)
				local r=math.random(220,255)
				e:SetColor(r,r,r)
				for l=1,a do
				timer.Simple(l*t,function()e:SetMaterial("particles/minecraft/smoke"..a-l)end)end
			end
	m:Finish()
end
function EFFECT:Think()return false end
function EFFECT:Render()end
