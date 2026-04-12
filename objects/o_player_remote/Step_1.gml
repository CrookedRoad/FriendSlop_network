event_inherited();
phy_position_x = lerp(phy_position_x, posX_target, lerpSpeed);
phy_position_y = lerp(phy_position_y, posY_target, lerpSpeed);
phy_rotation = lerp(phy_rotation, rotation_target, lerpSpeed);
armDirection = 0;