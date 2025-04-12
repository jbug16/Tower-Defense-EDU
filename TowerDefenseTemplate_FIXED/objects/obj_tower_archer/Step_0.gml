
// If game is paused or in quiz, don't fire
if (global.paused || global.quiz_active) exit;

// Set depth based on its y value
depth = -y;

// Set the distance calculation a bit up from the base of the sprite
var _target_y = y - 39

// Declare the temporary variables 
var _farthest, _farthest_val;
_farthest = noone;
_farthest_val = 0;

// Loop through all current enemies
with (obj_enemy_parent) 
{
    var _check_ellipse_collision = (sqr(x - other.x)/sqr(other.range)) + (sqr(y - _target_y)/sqr(other.range * 0.75));
    
    if (_check_ellipse_collision < 1)
    {
        if (_farthest == noone || path_position > _farthest_val) 
        {		
            _farthest = id;
            _farthest_val = path_position;
        }
    }
}

if (!is_undefined(_farthest) && instance_exists(_farthest) && ready_to_fire)
{
    var _fx = _farthest.x;
    var _fy = _farthest.y;

    if (!is_nan(_fx) && !is_nan(_fy))
    {
        with (instance_create_depth(x, y - 100, depth, obj_arrow)) 
        {
            image_angle = point_direction(x, y, _fx, _fy - 125);
            direction = image_angle;

            var _layer = layer_create(-(y + 105));
            var _seq = layer_sequence_create(_layer, x, y, seq_arrow_fire);
            layer_sequence_angle(_seq, image_angle);
        }

        ready_to_fire = false;
        alarm[0] = fire_delay;
    }
}
