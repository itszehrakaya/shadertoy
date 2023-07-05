void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    // Center of the screen
    vec2 center = iResolution.xy / 2.0;

    // Radius and thickness of the circles
    float radius1 = 0.5 * min(iResolution.x, iResolution.y);
    float thickness1 = 0.05 * min(iResolution.x, iResolution.y);
    
    float radius2 = 0.4 * min(iResolution.x, iResolution.y);
    float thickness2 = 0.04 * min(iResolution.x, iResolution.y);

    float radius3 = 0.3 * min(iResolution.x, iResolution.y);
    float thickness3 = 0.03 * min(iResolution.x, iResolution.y);
    // Calculate the distance from the center
    float dist1 = length(fragCoord - center);
    float dist2 = length(fragCoord - center);
    float dist3 = length(fragCoord - center);
    // Create a smooth transition between the inside and outside of the circles
    float circle1 = smoothstep(radius1 - thickness1, radius1, dist1);
    float circle2 = smoothstep(radius2 - thickness2, radius2, dist2);
    float circle3 = smoothstep(radius3 - thickness3, radius3, dist3);
    // Set the colors of the circles
    vec3 color1 = vec3(0.051, 0.051, 0.7882); // Red
    vec3 color2 = vec3(0.3137, 0.051, 0.3373); // Blue
    vec3 color3 = vec3(0.102, 0.051, 0.8118); // Blue
    // Combine the circles and set the background color to white
    vec3 finalColor = mix(vec3(0.5922, 0.4706, 0.8235), color1, circle1) + mix(vec3(0.0235, 0.0118, 0.0039), color2, circle2) + mix(vec3(0.6667, 0.0235, 0.0235), color3, circle3);

    // Output the final color
    fragColor = vec4(finalColor, 1.0);
}
