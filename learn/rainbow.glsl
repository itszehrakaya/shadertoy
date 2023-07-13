void mainImage(out vec4 fragColor, in vec2 fragCoord)
{
    // green circle  
    vec2 uv = fragCoord.xy / iResolution.xy;
    // vec3 col = vec3(0.1804, 0.0, 0.4902);
    float time = iTime ;
    vec3 col =0.5 + 0.5 * cos(vec3(time*0.5+ step(0.5,uv),0.3));
    fragColor = vec4(col,1.0);

    
}