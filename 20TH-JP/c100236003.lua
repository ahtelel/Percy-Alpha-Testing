--運命のドロー
--Draw of Destiny
--Scripted by AlphaKretin and [whoever finished it]
local s,id=GetID()
function s.initial_effect(c)
	--Activate
	local e1=Effect.CreateEffect(c)
	e1:SetCategory(CATEGORY_DRAW)
	e1:SetType(EFFECT_TYPE_ACTIVATE)
	e1:SetCode(EVENT_FREE_CHAIN)
	e1:SetCountLimit(1,id+EFFECT_COUNT_CODE_OATH)
	e1:SetCondition(s.drcon)
	e1:SetTarget(s.drtg)
	e1:SetOperation(s.drop)
	c:RegisterEffect(e1)
end
function s.drcon(e,tp,eg,ep,ev,re,r,rp)
	local g=Duel.GetFieldGroup(tp,LOCATION_MZONE,LOCATION_MZONE)
	local mg=g and Duel.GetMaxGroup(g,Card.GetAttack)
	--current assumption on ruling is like Dinomist Brachion, "(even if it's tied)". 
	--change to not mg:IsExists(...,tp) if rulings contradict
	return Duel.GetLP(tp)<Duel.GetLP(1-tp) and mg and mg:IsExists(Card.IsControler,1,nil,1-tp)
end
function s.drtg(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return Duel.IsPlayerCanDraw(tp,1) and Duel.GetFieldGroupCount(tp,LOCATION_DECK,0)>2 end
	Duel.SetOperationInfo(0,CATEGORY_DRAW,nil,0,tp,1)
end
function s.drop(e,tp,eg,ep,ev,re,r,rp,chk)
end
