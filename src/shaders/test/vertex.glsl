uniform mat4 projectionMatrix;
uniform mat4 viewMatrix;
uniform mat4 modelMatrix;
uniform vec2 uFrequency;
uniform vec2 uMouse;
uniform float uTime;

attribute float aRandom;

attribute vec3 position;
attribute vec2 uv;


varying float vRandom;
varying vec2 vUv;
varying float vElevation;
varying float vTime;
void main()
{
  vec4 modelPosition = modelMatrix * vec4(position, 1.0);

  float elevation = sin(modelPosition.x * uFrequency.x - uTime) * 0.1 ;

  modelPosition.z += uMouse.y;
  modelPosition.z += sin(modelPosition.y * uFrequency.y - uTime ) * uMouse.x +  (aRandom /20.0) ;


  vec4 viewPosition = viewMatrix * modelPosition;

  vec4 projectedPosition = projectionMatrix * viewPosition;

  gl_Position = projectedPosition;

  // gl_Position = projectionMatrix * viewMatrix * modelMatrix * vec4(position, 1.0);

  vRandom = aRandom;
  vUv = uv;
  vElevation = elevation;
  vTime = uTime;

}
