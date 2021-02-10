precision mediump float;
uniform vec3 uColor;
varying float vRandom;

uniform sampler2D uTexture;

varying vec2 vUv;
varying float vElevation;

void main()
{
  vec4 textureColor = texture2D(uTexture, vUv);
  //textureColor.rgb *= vElevation *1.0 + 0.5;
  gl_FragColor = textureColor;
  //gl_FragColor = vec4(0.5, vRandom * 0.5, 1.0, 1.0);
}
