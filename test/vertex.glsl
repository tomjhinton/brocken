uniform mat4 projectionMatrix;
uniform mat4 viewMatrix;
uniform mat4 modelMatrix;
uniform vec2 uFrequency;

uniform float uTime;

attribute float aRandom;

attribute vec3 position;
attribute vec2 uv;


varying float vRandom;
varying vec2 vUv;
varying float vElevation;
void main()
{
  vec4 modelPosition = modelMatrix * vec4(position, 1.0);

  float elevation = sin(modelPosition.x * uFrequency.x - uTime) * 0.1 ;

  modelPosition.z += sin(modelPosition.x * uFrequency.x - uTime) * 0.1 ;
  modelPosition.z += sin(modelPosition.y * uFrequency.y - uTime ) * 0.1 +  (aRandom /10.0) ;
  //modelPosition.z += aRandom * 0.1;

  vec4 viewPosition = viewMatrix * modelPosition;

  vec4 projectedPosition = projectionMatrix * viewPosition;

  gl_Position = projectedPosition;

  // gl_Position = projectionMatrix * viewMatrix * modelMatrix * vec4(position, 1.0);

  vRandom = aRandom;
  vUv = uv;
  vElevation = elevation;

}
