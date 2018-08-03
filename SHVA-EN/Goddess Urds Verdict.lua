--女神ウルドの裁断
--Goddess Urd's Verdict
--Scripted by Eerie Code and AlphaKretin
function c100243010.initial_effect(c)
	--Activate
	local e1=Effect.CreateEffect(c)
	e1:SetCategory(CATEGORY_TOHAND+CATEGORY_SEARCH)
	e1:SetType(EFFECT_TYPE_ACTIVATE)
	e1:SetCode(EVENT_FREE_CHAIN)
	c:RegisterEffect(e1)
	--cannot be target
	local e2=Effect.CreateEffect(c)
	e2:SetType(EFFECT_TYPE_FIELD)
	e2:SetCode(EFFECT_INDESTRUCTABLE_EFFECT)
	e2:SetRange(LOCATION_SZONE)
	e2:SetTargetRange(LOCATION_MZONE,0)
	e2:SetTarget(aux.TargetBoolFunction(Card.IsSetCard,0x228))
	e2:SetValue(c100243010.indesval)
	c:RegisterEffect(e2)
	local e3=e2:Clone()
	e3:SetCode(EFFECT_CANNOT_BE_EFFECT_TARGET)
	e3:SetProperty(EFFECT_FLAG_IGNORE_IMMUNE)
	e3:SetValue(aux.tgoval)
	c:RegisterEffect(e3)
	--remove
	local e4=Effect.CreateEffect(c)
	e4:SetCategory(CATEGORY_REMOVE)
	e4:SetDescription(aux.Stringid(100243010,0))
	e4:SetType(EFFECT_TYPE_IGNITION)
	e4:SetCountLimit(1)
	e4:SetRange(LOCATION_SZONE)
	e4:SetTarget(c100243010.rmtg)
	e4:SetOperation(c100243010.rmop)
	c:RegisterEffect(e4)
end
function c100243010.indesval(e,re,rp)
	return rp~=e:GetHandlerPlayer()
end
function c100243010.rmfilter(c)
	return c:IsFacedown() and c:IsAbleToRemove()
end
function c100243010.rmtg(e,tp,eg,ep,ev,re,r,rp,chk,chkc)
	if chkc then return chkc:GetControler()~=tp and chkc:IsLocation(LOCATION_ONFIELD) and c100243010.rmfilter(chkc) end
	if chk==0 then return Duel.IsExistingTarget(c100243010.rmfilter,tp,0,LOCATION_ONFIELD,1,nil) end
	local g=Duel.SelectTarget(tp,c100243010.rmfilter,tp,0,LOCATION_ONFIELD,1,1,nil)
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_CODE)
	local ac=Duel.AnnounceCard(tp)
	Duel.SetTargetParam(ac)
	Duel.SetOperationInfo(0,CATEGORY_ANNOUNCE,nil,0,tp,ANNOUNCE_CARD)
end
function c100243010.rmop(e,tp,eg,ep,ev,re,r,rp)
	local ac=Duel.GetChainInfo(0,CHAININFO_TARGET_PARAM)
	local tc=Duel.GetFirstTarget()
	if e:GetHandler():IsRelateToEffect(e) and tc and tc:IsRelateToEffect(e) and tc:IsCode(ac) then
		Duel.Remove(tc,POS_FACEUP,REASON_EFFECT)
	end
end
