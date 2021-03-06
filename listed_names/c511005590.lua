--Landstar Shoot
--scripted by GameMaster(GM)
function c511005590.initial_effect(c)
	--Activate
	local e1=Effect.CreateEffect(c)
	e1:SetCategory(CATEGORY_EQUIP)
	e1:SetType(EFFECT_TYPE_ACTIVATE)
	e1:SetCode(EVENT_FREE_CHAIN)
	e1:SetProperty(EFFECT_FLAG_CARD_TARGET+EFFECT_FLAG_CANNOT_DISABLE)
	e1:SetTarget(c511005590.target)
	e1:SetOperation(c511005590.operation)
	c:RegisterEffect(e1)
	--Atk up
	local e2=Effect.CreateEffect(c)
	e2:SetType(EFFECT_TYPE_EQUIP)
	e2:SetCode(EFFECT_UPDATE_ATTACK)
	e2:SetValue(600)
	c:RegisterEffect(e2)
--Equip limit
    local e3=Effect.CreateEffect(c)
    e3:SetType(EFFECT_TYPE_SINGLE)
    e3:SetCode(EFFECT_EQUIP_LIMIT)
    e3:SetProperty(EFFECT_FLAG_CANNOT_DISABLE)
    e3:SetValue(1)
    c:RegisterEffect(e3)
end
c511005590.listed_names={100000630,100000631,100000632,3573512,83602069,100000630,100000631,100000632,3573512,83602069}
function c511005590.eqlimit(e,c)
	return c:IsCode(100000630) and c:IsCode(100000631) and c:IsCode(100000632) and c:IsCode(3573512) and c:IsCode(83602069)
end
function c511005590.filter(c)
	return c:IsFaceup() and c:IsCode(100000630) or c:IsCode(100000631) or c:IsCode(100000632) or c:IsCode(3573512) or c:IsCode(83602069)
end
function c511005590.target(e,tp,eg,ep,ev,re,r,rp,chk,chkc)
	if chkc then return chkc:IsLocation(LOCATION_MZONE) and c511005590.filter(chkc) end
	if chk==0 then return Duel.IsExistingTarget(c511005590.filter,tp,LOCATION_MZONE,LOCATION_MZONE,1,nil) end
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_EQUIP)
	Duel.SelectTarget(tp,c511005590.filter,tp,LOCATION_MZONE,LOCATION_MZONE,1,1,nil)
	Duel.SetOperationInfo(0,CATEGORY_EQUIP,e:GetHandler(),1,0,0)
end
function c511005590.operation(e,tp,eg,ep,ev,re,r,rp)
	local tc=Duel.GetFirstTarget()
	if e:GetHandler():IsRelateToEffect(e) and tc:IsRelateToEffect(e) and tc:IsFaceup() then
		Duel.Equip(tp,e:GetHandler(),tc)
	end
end
