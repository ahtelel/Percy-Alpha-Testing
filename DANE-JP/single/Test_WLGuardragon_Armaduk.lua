Debug.SetAIName("Merry Revealsmas")
Debug.ReloadFieldBegin(DUEL_ATTACK_FIRST_TURN+DUEL_TEST_MODE,4)

Debug.SetPlayerInfo(0,8000,0,1)
Debug.SetPlayerInfo(1,8000,0,0)

Debug.AddCard(101008032,0,0,LOCATION_EXTRA,0,POS_FACEDOWN)

Debug.AddCard(41999284,0,0,LOCATION_MZONE,0,POS_FACEUP_ATTACK)
Debug.AddCard(53413628,0,0,LOCATION_MZONE,2,POS_FACEUP_ATTACK)
Debug.AddCard(1861629,0,0,LOCATION_MZONE,5,POS_FACEUP_ATTACK)

Debug.AddCard(24094653,0,0,LOCATION_HAND,0,POS_FACEDOWN)

Debug.AddCard(41999284,1,1,LOCATION_MZONE,0,POS_FACEUP_ATTACK)
Debug.AddCard(53413628,1,1,LOCATION_MZONE,2,POS_FACEUP_ATTACK)
Debug.AddCard(1861629,1,1,LOCATION_MZONE,5,POS_FACEUP_ATTACK)

Debug.ReloadFieldEnd()

