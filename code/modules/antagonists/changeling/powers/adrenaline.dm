/obj/effect/proc_holder/changeling/adrenaline
	name = "Adrenaline Sacs"
	desc = "We evolve additional sacs of adrenaline throughout our body."
	helptext = "Removes all stuns instantly and adds a short-term reduction in further stuns. Can be used while unconscious. Continued use poisons the body."
	chemical_cost = 30
	dna_cost = 2
	req_human = 1
	req_stat = UNCONSCIOUS
	action_icon = 'icons/mob/actions/actions_changeling.dmi'
	action_icon_state = "ling_adrenals"
	action_background_icon_state = "bg_ling"

//Recover from stuns.
/obj/effect/proc_holder/changeling/adrenaline/sting_action(mob/living/user)
	to_chat(user, "<span class='notice'>Energy rushes through us.[user.lying ? " We arise." : ""]</span>")
	user.SetSleeping(0)
	user.SetUnconscious(0)
	user.SetStun(0)
	user.SetKnockdown(0)
	user.reagents.add_reagent("changelingadrenaline", 10)
	user.reagents.add_reagent("changelinghaste", 2) //For a really quick burst of speed
	user.adjustStaminaLoss(-150)
	user.stuttering = 0
	user.updatehealth()
	user.update_stamina()
	user.resting = 0
	user.lying = 0
	user.update_canmove()

	return TRUE

