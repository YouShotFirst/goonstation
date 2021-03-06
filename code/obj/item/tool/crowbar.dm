/obj/item/crowbar
	name = "crowbar"
	desc = "A tool used as a lever to pry objects."
	icon = 'icons/obj/items/tools/crowbar.dmi'
	// TODO: crowbar inhand icon
	inhand_image_icon = 'icons/mob/inhand/tools/crowbar.dmi'
	icon_state = "crowbar"
	item_state = "crowbar"

	flags = FPRINT | TABLEPASS | CONDUCT | ONBELT
	tool_flags = TOOL_PRYING
	w_class = 2.0

	force = 5.0
	throwforce = 7.0
	stamina_damage = 33
	stamina_cost = 25
	stamina_crit_chance = 10

	m_amt = 50
	module_research = list("tools" = 4, "metals" = 2)
	rand_pos = 1
	custom_suicide = 1

	New()
		..()
		src.setItemSpecial(/datum/item_special/tile_fling)
		BLOCK_ROD

	suicide(var/mob/user as mob)
		if (!src.user_can_suicide(user))
			return 0
		user.visible_message("<span class='alert'><b>[user] beats [him_or_her(user)]self in the head with a crowbar, like some kind of suicidal theoretical physicist.</b></span>")
		take_bleeding_damage(user, null, 25, src.hit_type)
		user.TakeDamage("head", 160, 0)
		user.updatehealth()
		return 1

/obj/item/crowbar/vr
	icon_state = "crowbar-vr"
