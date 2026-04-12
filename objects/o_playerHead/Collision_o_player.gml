if delay <= 0{
if (phy_position_y < other.phy_position_y-15){
if (phy_position_x > other.phy_position_x-5) && (phy_position_x < other.phy_position_x+5){
	if other.id == bodyID{
		instance_destroy();
		with(other){
			headSprite = other.sprite_index;
			if object_index == o_player_local{
				scr_viewFollowTarg_set_perm(id);
			}
		}
	}
}
}
}