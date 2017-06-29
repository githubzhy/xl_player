precision mediump float;
varying vec2 tx;
uniform sampler2D tex_y;
uniform sampler2D tex_u;
uniform sampler2D tex_v;
void main(void)
{
    vec2 tx_flip_y = vec2(tx.x, 1.0 - tx.y);
    float y = texture2D(tex_y, tx_flip_y).r;
    float u = texture2D(tex_u, tx_flip_y).r - 0.5;
    float v = texture2D(tex_v, tx_flip_y).r - 0.5;
    float r = y +             1.402 * v;
    float g = y - 0.344 * u - 0.714 * v;
    float b = y + 1.772 * u;
    gl_FragColor = vec4(r, g, b, 1.0);
}