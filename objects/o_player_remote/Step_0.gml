if !moving{
	armAngle = lerp(armAngle, 20*image_xscale, 0.2);
	legAngle = lerp(legAngle, 0, 0.2);
	legOffset = lerp(legOffset, 0, 0.2);
	bodyOffset = 0;
	bodyAngle = 0;
}
if (climbing){
	armDirection = 90*image_xscale;
}
if (pushing){
	armDirection = 90*image_xscale;
}

if speed_ver > 3{
	bodySpring = 10;
	armAngle = lerp(armAngle, 90*image_xscale, 0.4);
}
if speed_ver > 5{
	bodySpring = 0;
}