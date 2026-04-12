posX = lerp(posX, x, lerpSpeed);
posY = lerp(posY, y, lerpSpeed);
if bodySpring > 0 then bodySpring -= 0.5;
bodySpring_draw = lerp(bodySpring_draw, bodySpring, 0.2);

var length = 30;
var time = current_time/60;
if (running){length = 50; time = current_time/50;}
if (moving){
	breath = 1;
	if bodySpring < 5{
		legAngle = sin(time) * length;
		legOffset = sin(time) * 3;
		
		armAngle = sin(time) * length;
	} else{
		legAngle = 0;
		legOffset = 0;
	}
} else{
	breath = abs(sin(current_time/250) * 1);
}


var legPosAngle = (image_angle+(300*image_xscale));
var legPosX, legPosY;
	legPosX = posX + (lengthdir_x(7, legPosAngle)*image_xscale);
	legPosY = posY + (lengthdir_y(7, legPosAngle)*image_xscale);
draw_sprite_ext(legSprite, 1, legPosX-legOffset, legPosY, image_xscale, image_yscale, image_angle-legAngle, image_blend, image_alpha);

var legPosAngle = (image_angle+(240*image_xscale));
var legPosX, legPosY;
	legPosX = posX + (lengthdir_x(7, legPosAngle)*image_xscale);
	legPosY = posY + (lengthdir_y(7, legPosAngle)*image_xscale);
draw_sprite_ext(legSprite, 0, legPosX+legOffset, legPosY, image_xscale, image_yscale, image_angle+legAngle, image_blend, image_alpha);


if (moving){
var offset = sin(time) * 2;
	bodyAngle = sin(time) * (length/10);
	bodyOffset = lerp(bodyOffset, offset, 0.1);
}
var bodyPosX, bodyPosY;
	bodyPosX = posX;
	bodyPosY = posY-bodyOffset+bodySpring_draw;

var armBreath = (breath*5)*image_xscale;
var armPosAngle = (image_angle+(20*image_xscale));
var armPosX, armPosY;
	armPosX = posX + (lengthdir_x(7, armPosAngle)*image_xscale);
	armPosY = (bodyPosY+breath) + (lengthdir_y(7, armPosAngle)*image_xscale);
draw_sprite_ext(armSprite, 1, armPosX, armPosY, image_xscale, image_yscale, image_angle+armAngle+armDirection+armBreath, image_blend, image_alpha);


draw_sprite_ext(bodySprite, 0, bodyPosX, bodyPosY+breath, image_xscale, image_yscale, image_angle-bodyAngle, image_blend, image_alpha);
draw_sprite_ext(headSprite, 0, bodyPosX, bodyPosY-breath, image_xscale, image_yscale, image_angle-bodyAngle, image_blend, image_alpha);


var armPosAngle = (image_angle+(160*image_xscale));
var armPosX, armPosY;
	armPosX = posX + (lengthdir_x(7, armPosAngle)*image_xscale);
	armPosY = (bodyPosY+breath) + (lengthdir_y(7, armPosAngle)*image_xscale);
draw_sprite_ext(armSprite, 0, armPosX, armPosY, image_xscale, image_yscale, image_angle-armAngle+armDirection-armBreath, image_blend, image_alpha);