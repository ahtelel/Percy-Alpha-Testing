--Boldly Invincible
--scripted by ???
local s,id=GetID()
function s.initial_effect(c)
	--activate
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_ACTIVATE)
	e1:SetCode(EVENT_FREE_CHAIN)
	c:RegisterEffect(e1)
	--heal
	local e2=Effect.CreateEffect(c)
	e2:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_CONTINUOUS)
	e2:SetCode(EVENT_SUMMON_SUCCESS)
	e2:SetRange(LOCATION_SZONE)
	e2:SetCondition(s.hcondition)
	e2:SetOperation(s.hoperation)
	c:RegisterEffect(e2)
	local e3=e2:Clone()
	e2:SetCode(EVENT_FLIP_SUMMON_SUCCESS)
	c:RegisterEffect(e3)
	local e4=e2:Clone()
	e4:SetCode(EVENT_SPSUMMON_SUCCESS)
	c:RegisterEffect(e4)
	--battle protection
	local e5=Effect.CreateEffect(c)
	e5:SetType(EFFECT_TYPE_FIELD)
	e5:SetCode(EFFECT_INDESTRUCTABLE_BATTLE)
	e5:SetTargetRange(LOCATION_MZONE,0)
	e5:SetRange(LOCATION_SZONE)
	e5:SetCondition(s.bpcondition)
	c:RegisterEffect(e5)
end
function s.filter(c,tp)
	return c:GetSummonPlayer()~=tp
end
function s.hcondition(e,tp,eg,ep,ev,re,r,rp)
	return eg and eg:IsExists(c101007069.filter,1,nil,tp)
end
function s.bpcondition(e)
	return Duel.GetLP(e:GetHandlerPlayer())>=10000
end
