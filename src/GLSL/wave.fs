// Copyright 2026 Seiichi Ariga <seiichi.ariga@gmail.com>
// SPDX-License-Identifier: MIT

#version 450

in vec2 fragTexCoord;
out vec4 finalColor;

uniform float seconds;// Nim側から送る時間

// 2D座標から乱数を生成するハッシュ関数
float hash(vec2 p){
    return fract(sin(dot(p,vec2(127.1,311.7))*43758.5453123));
}

float noise(vec2 p){
    vec2 i=floor(p);
    vec2 f=fract(p);
    
    // 4点のノイズを生成
    float a=hash(i);
    float b=hash(i+vec2(1.,0.));
    float c=hash(i+vec2(0.,1.));
    float d=hash(i+vec2(1.,1.));
    
    // 補間係数
    vec2 u=f*f*(3.-2.*f);
    
    // 補間してノイズ値を返す
    return mix(a,b,u.x)+(c-a)*u.y*(1.-u.x)+(d-b)*u.x*u.y;
}

void main(){
    vec2 uv=fragTexCoord;
    
    // 奥の波（ゆっくり、少し明るい）
    float n1=noise(uv*8.+seconds*.5);
    float wave1=sin(uv.x*10.+seconds)*.1+.4+n1*.03;
    float layer1=smoothstep(wave1+.01,wave1,uv.y);
    
    // 手前の波（速い、濃い青）
    float n2=noise(uv*12.+seconds*1.2);
    float wave2=sin(uv.x*15.+seconds*2.)*.1+.6+n2*.05;
    float layer2=smoothstep(wave2+.01,wave2,uv.y);
    
    // 背景色
    vec3 color=vec3(.1,.1,.15);
    // 奥の波を重ねる
    color=mix(color,vec3(0.,.5,.9),layer1);
    // 手前の波をさらに重ねる
    color=mix(color,vec3(0.,.3,.7),layer2);
    
    finalColor=vec4(color,1.);
}