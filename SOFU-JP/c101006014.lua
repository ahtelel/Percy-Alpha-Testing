--オルフェゴール・カノーネ
--Orphegel Canon
function c101006014.initial_effect(c)
	--special summon
	local e1=Effect.CreateEffect(c)
	e1:SetCategory(CATEGORY_SPECIAL_SUMMON)
	e1:SetDescription(aux.Stringid(101006014,0))
	e1:SetType(EFFECT_TYPE_IGNITION)
	e1:SetRange(LOCATION_GRAVE)
	e1:SetCountLimit(1,101006014)
	e1:SetCondition(c101006014.igcon)
	e1:SetCost(aux.bfgcost)
	e1:SetTarget(c101006014.sptg)
	e1:SetOperation(c101006014.spop)
	c:RegisterEffect(e1)
	local e2=e1:Clone()
	e2:SetType(EFFECT_TYPE_QUICK_O)
	e2:SetCode(EVENT_FREE_CHAIN)
	e2:SetCondition(c101006014.qcon)
	c:RegisterEffect(e2)
end
function c101006014.filter(c,e,tp)
	return c:IsSetCard(0x225) and c:IsCanBeSpecialSummoned(e,0,tp,false,false) and not c:IsCode(101006014)
end
function c101006014.sptg(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return Duel.GetLocationCount(tp,LOCATION_MZONE)>0
		and Duel.IsExistingMatchingCard(c101006014.filter,tp,LOCATION_HAND,0,1,nil,e,tp) end
	Duel.SetOperationInfo(0,CATEGORY_SPECIAL_SUMMON,nil,1,tp,LOCATION_HAND)
end
function c101006014.spop(e,tp,eg,ep,ev,re,r,rp)
	if Duel.GetLocationCount(tp,LOCATION_MZONE)<=0 then return end
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_SPSUMMON)
	local g=Duel.SelectMatchingCard(tp,c101006014.filter,tp,LOCATION_HAND,0,1,1,nil,e,tp)
	if g:GetCount()>0 then
		Duel.SpecialSummon(g,0,tp,tp,false,false,POS_FACEUP)
		local e1=Effect.CreateEffect(e:GetHandler())
		e1:SetType(EFFECT_TYPE_FIELD)
		e1:SetCode(EFFECT_CANNOT_SPECIAL_SUMMON)
		e1:SetProperty(EFFECT_FLAG_PLAYER_TARGET+EFFECT_FLAG_OATH)
		e1:SetTargetRange(1,0)
		e1:SetTarget(c101006014.splimit)
		e1:SetReset(RESET_PHASE+PHASE_END)
		Duel.RegisterEffect(e1,tp)
	end
end
function c101006014.splimit(e,c,sump,sumtype,sumpos,targetp)
	return not c:IsAttribute(ATTRIBUTE_DARK)
end
function c101006014.igcon(e,tp,eg,ep,ev,re,r,rp)
	local CARD_ORPHEGEL_BABEL = 101006057
	return not e:GetHandler():IsHasEffect(CARD_ORPHEGEL_BABEL)
end
function c101006014.qcon(e,tp,eg,ep,ev,re,r,rp)
	local CARD_ORPHEGEL_BABEL = 101006057
	return e:GetHandler():IsHasEffect(CARD_ORPHEGEL_BABEL)
end
