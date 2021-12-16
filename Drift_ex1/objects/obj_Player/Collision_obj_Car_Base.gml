/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (crashSound){
audio_play_sound_at(SoundCrashIntoCar, x, y, 0, 100, 300, 1, false, 1);
crashSound = false;
alarm[4] = 30;
}