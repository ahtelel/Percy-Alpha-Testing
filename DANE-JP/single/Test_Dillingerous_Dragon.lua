Debug.SetAIName("Merry Revealsmas")
Debug.ReloadFieldBegin(DUEL_ATTACK_FIRST_TURN+DUEL_TEST_MODE,4)

Debug.SetPlayerInfo(0,8000,0,1)
Debug.SetPlayerInfo(1,8000,0,0)

Debug.AddCard(27877771,0,0,LOCATION_MZONE,0,POS_FACEUP_DEFENSE)
Debug.AddCard(27877771,0,0,LOCATION_MZONE,1,POS_FACEUP_DEFENSE)

Debug.AddCard(31443476,0,0,LOCATION_HAND,0,POS_FACEDOWN)
Debug.AddCard(48355999,0,0,LOCATION_DECK,0,POS_FACEDOWN)

Debug.AddCard(101008041,0,0,LOCATION_EXTRA,0,POS_FACEDOWN)
Debug.AddCard(101008041,0,0,LOCATION_GRAVE,0,POS_FACEUP,true)

Debug.AddCard(27877771,1,1,LOCATION_MZONE,1,POS_FACEUP_ATTACK)



Debug.ReloadFieldEnd()

