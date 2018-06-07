--X－レイ・ピアース
function c86559484.initial_effect(c)
	--special summon
	local e1=Effect.CreateEffect(c)
	e1:SetDescription(aux.Stringid(86559484,0))
	e1:SetCategory(CATEGORY_SPECIAL_SUMMON)
	e1:SetType(EFFECT_TYPE_IGNITION)
	e1:SetRange(LOCATION_MZONE)
	e1:SetCountLimit(1,86559484)
	e1:SetCost(c86559484.spcost)
	e1:SetTarget(c86559484.sptg)
	e1:SetOperation(c86559484.spop)
	c:RegisterEffect(e1)
	--damage
	local e2=Effect.CreateEffect(c)
	e2:SetDescription(aux.Stringid(86559484,1))
	e2:SetCategory(CATEGORY_DAMAGE)
	e2:SetType(EFFECT_TYPE_SINGLE+EFFECT_TYPE_TRIGGER_O)
	e2:SetCode(EVENT_TO_GRAVE)
	e2:SetProperty(EFFECT_FLAG_PLAYER_TARGET+EFFECT_FLAG_DAMAGE_STEP+EFFECT_FLAG_DELAY)
	e2:SetCountLimit(1,86559485)
	e2:SetCondition(c86559484.damcon)
	e2:SetTarget(c86559484.damtg)
	e2:SetOperation(c86559484.damop)
	c:RegisterEffect(e2)
end
c86559484.listed_names={86559484}
function c86559484.cfilter(c,rac)
	return c:IsRace(rac) and c:IsAbleToRemoveAsCost() and aux.SpElimFilter(c,true)
end
function c86559484.rescon(sg,e,tp,mg)
	return aux.ChkfMMZ(1)(sg,e,tp,mg) and sg:IsExists(c86559484.atchk1,1,nil,sg)
end
function c86559484.atchk1(c,sg)
	return c:IsRace(RACE_DRAGON) and sg:FilterCount(Card.IsRace,c,RACE_WYRM)==1
end
function c86559484.spcost(e,tp,eg,ep,ev,re,r,rp,chk)
	local rg1=Duel.GetMatchingGroup(c86559484.cfilter,tp,LOCATION_MZONE+LOCATION_GRAVE,0,nil,RACE_DRAGON)
	local rg2=Duel.GetMatchingGroup(c86559484.cfilter,tp,LOCATION_MZONE+LOCATION_GRAVE,0,nil,RACE_WYRM)
	local rg=rg1:Clone()
	rg:Merge(rg2)
	if chk==0 then return Duel.GetLocationCount(tp,LOCATION_MZONE)>-2 and rg1:GetCount()>0 and rg2:GetCount()>0 
		and aux.SelectUnselectGroup(rg,e,tp,2,2,c86559484.rescon,0) end
	local g=aux.SelectUnselectGroup(rg,e,tp,2,2,c86559484.rescon,1,tp,HINTMSG_REMOVE)
	Duel.Remove(g,POS_FACEUP,REASON_COST)
end
function c86559484.spfilter(c,e,tp)
	return c:IsCode(86559484) and c:IsCanBeSpecialSummoned(e,0,tp,false,false)
end
function c86559484.sptg(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return Duel.IsExistingMatchingCard(c86559484.spfilter,tp,LOCATION_HAND+LOCATION_DECK,0,1,nil,e,tp) end
	Duel.SetOperationInfo(0,CATEGORY_SPECIAL_SUMMON,nil,1,tp,LOCATION_HAND+LOCATION_DECK)
end
function c86559484.spop(e,tp,eg,ep,ev,re,r,rp)
	if Duel.GetLocationCount(tp,LOCATION_MZONE)<=0 then return end
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_SPSUMMON)
	local g=Duel.SelectMatchingCard(tp,c86559484.spfilter,tp,LOCATION_HAND+LOCATION_DECK,0,1,1,nil,e,tp)
	if g:GetCount()>0 then
		Duel.SpecialSummon(g,0,tp,tp,false,false,POS_FACEUP)
	end
end
function c86559484.damcon(e,tp,eg,ep,ev,re,r,rp)
	return e:GetHandler():IsPreviousLocation(LOCATION_ONFIELD)
end
function c86559484.damtg(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return true end
	Duel.SetTargetPlayer(1-tp)
	Duel.SetTargetParam(500)
	Duel.SetOperationInfo(0,CATEGORY_DAMAGE,nil,0,1-tp,500)
end
function c86559484.damop(e,tp,eg,ep,ev,re,r,rp)
	local p,d=Duel.GetChainInfo(0,CHAININFO_TARGET_PLAYER,CHAININFO_TARGET_PARAM)
	Duel.Damage(p,d,REASON_EFFECT)
end