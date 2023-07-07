void mainImage(out vec4 fragColor, in vec2 fragCoord)
{
    // green circle  
    vec2 uv = fragCoord.xy / iResolution.xy;
    vec2 center = vec2(0.5, 0.5);
    float time =iTime*0.5 ;
    float radius =tan(time);
    float dist = distance(uv, center);
    float circle = smoothstep(radius, radius + 0.01, dist);
    vec3 color = vec3(circle);
    //show
    fragColor = vec4(color, 0.3);

}