event_inherited();
armDirection = 0;
var diff = angle_difference(-phy_rotation, -rotation_target);
phy_rotation -= diff*lerpSpeed;