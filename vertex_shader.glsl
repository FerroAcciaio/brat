// Vertex Shader
attribute vec3 aPosition;   // Posizione del vertice
attribute vec2 aTexCoord;   // Coordinate texture (opzionale)
uniform mat4 modelViewProjectionMatrix; // Matrice di proiezione e vista

void main() {
  gl_Position = modelViewProjectionMatrix * vec4(aPosition, 1.0);  // Calcola la posizione finale del vertice
}
