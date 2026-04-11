if (other.phy_position_y < phy_position_y-20){
var impact_speed = other.phy_speed;
var impact_force = other.phy_mass * impact_speed;
    
    show_debug_message("Получил по голове объектом " + object_get_name(other.object_index));
    show_debug_message("Сила удара: " + string(impact_force));
    if impact_force > 10{
		HP -= 10;
		HP = clamp(HP, 0, maxhp);
		event_user(0);
    }
}