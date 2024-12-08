// Fragment Shader
precision mediump float;

uniform float blurAmount; // Quanto deve essere sfocata la particella
uniform sampler2D tex;    // La texture (opzionale, se usi una texture)
varying vec2 vTexCoord;   // Coordinate texture

void main() {
  // Recupera il colore dalla texture
  vec4 color = texture2D(tex, vTexCoord);
  
  // Applicazione di un semplice filtro di sfocatura: campiona attorno al pixel
  vec4 blurredColor = vec4(0.0);
  float total = 0.0;

  // La logica per la sfocatura (kernel semplice)
  for (float x = -blurAmount; x <= blurAmount; x += 1.0) {
    for (float y = -blurAmount; y <= blurAmount; y += 1.0) {
      vec2 offset = vec2(x, y) * 0.01;  // La quantità di sfocatura da applicare
      blurredColor += texture2D(tex, vTexCoord + offset);
      total += 1.0;
    }
  }
  
  // Media dei colori campionati
  blurredColor /= total;
  
  // Imposta il colore finale
  gl_FragColor = blurredColor;
}