// This is a very simple mandelbrot set that I made, the starting Z value is dependant on the mouse cursor position

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    // Normalized pixel coordinates (from 0 to 1)
    vec2 uv = (fragCoord-0.5*iResolution.xy) / (.5*iResolution.y);
    // vec2 uv = fragCoord/iResolution.xy;
    

    // float i = float(calc_mandel(uv, vec2(0.0, 0.0)));
    vec2 c = uv;
    vec2 z = (iMouse.xy-0.5*iResolution.xy) / (.5*iResolution.y);
    // vec2 c = vec2(0.0, 0.0);
    
    const float max_iter = 100.;
    float i = 0.;
    while (i < max_iter && length(z) <= 3.){
        z = vec2(z.x*z.x - z.y*z.y, 2.0*z.x*z.y) +  c;
        i++;
    }
    
    float f = i/max_iter;
    
    // Output to screen
    fragColor = vec4(vec3(f), 1.0);
}
