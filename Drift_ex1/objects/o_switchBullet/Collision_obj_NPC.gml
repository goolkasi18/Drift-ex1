/// @description Insert description here
// You can write your code in this editor
//other.hp -= damage;
other.audio_play_sound_at(SoundBulletImpact, x, y, 0, 100, 300, 1, false, 3);

with (other){
switchHit = true;
}

instance_destroy();