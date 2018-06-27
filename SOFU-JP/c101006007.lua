--Dinowrestler Capoeiraptor
--script by Naim
function c101006007.initial_effect(c)
	--indes battle
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetProperty(EFFECT_FLAG_SINGLE_RANGE)
	e1:SetRange(LOCATION_MZONE)
	e1:SetCode(EFFECT_INDESTRUCTABLE_BATTLE)
	e1:SetCondition(c101006007.indcond)
	e1:SetValue(1)
	c:RegisterEffect(e1)
	--pos change
	local e2=Effect.CreateEffect(c)
	e2:SetDescription(aux.Stringid(101006007,0))
	e2:SetCategory(CATEGORY_POSITION)
	e2:SetType(EFFECT_TYPE_SINGLE+EFFECT_TYPE_TRIGGER_F)
	e2:SetCode(EVENT_DAMAGE_STEP_END)
	e2:SetCondition(c101006007.poscon)
	e2:SetOperation(c101006007.posop)
	c:RegisterEffect(e2)
	--special summon
	local e3=Effect.CreateEffect(c)
	e3:SetCategory(CATEGORY_SPECIAL_SUMMON)
	e3:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_TRIGGER_O)
	e3:SetRange(LOCATION_MZONE)
	e3:SetCode(EVENT_PHASE+PHASE_STANDBY)
	e3:SetProperty(EFFECT_FLAG_CARD_TARGET)
	e3:SetCountLimit(1,101006007)
	e3:SetCondition(c101006007.spcon)
	e3:SetTarget(c101006007.sptg)
	e3:SetOperation(c101006007.spop)
	c:RegisterEffect(e3)
end
function c101006007.indcond(e)
	return e:GetHandler():IsAttackPos()
end
function c101006007.poscon(e,tp,eg,ep,ev,re,r,rp)
	return 
	-- this condition needs to be fixed
	-- this condition needs to be fixed
	-- this condition needs to be fixed
	-- this condition needs to be fixed
	e:GetHandler():IsAttackPos()
end
function c101006007.posop(e,tp,eg,ep,ev,re,r,rp)
	if e:GetHandler():IsRelateToEffect(e) then
		Duel.ChangePosition(e:GetHandler(),POS_FACEUP_DEFENSE)
	end
end
function c101006007.spcon(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	return c:IsFaceup() and c:IsDefensePos()
end
function c101006007.spfilter(c,e,tp)
	return c:IsCode(101006007) and c:IsCanBeSpecialSummoned(e,0,tp,false,false)
end
function c101006007.sptg(e,tp,eg,ep,ev,re,r,rp,chk,chkc)
	if chk==0 then return Duel.GetLocationCount(tp,LOCATION_MZONE)>0
		and Duel.IsExistingTarget(c101006007.spfilter,tp,LOCATION_DECK,0,1,nil,e,tp) end
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_SPSUMMON)
	local g=Duel.SelectTarget(tp,c101006007.spfilter,tp,LOCATION_DECK,0,1,1,nil,e,tp)
	Duel.SetOperationInfo(0,CATEGORY_SPECIAL_SUMMON,g,1,0,0)
end
function c101006007.spop(e,tp,eg,ep,ev,re,r,rp)
	local tc=Duel.GetFirstTarget()
	if tc:IsRelateToEffect(e) then
		Duel.SpecialSummon(tc,0,tp,tp,false,false,POS_FACEUP)
	end
end