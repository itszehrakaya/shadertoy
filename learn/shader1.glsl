void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    vec2 resolution = iResolution.xy;
    vec3 boxColor = vec3(0.5804, 0.702, 0.6157); // Blue color

    // Center the box in the middle of the screen
    vec2 boxCenter = resolution / 2.0;

    // Calculate normalized coordinates (-1 to 1)
    vec2 normalizedCoord = (fragCoord - boxCenter) / min(resolution.x, resolution.y);

    // Define the size of the box
    vec3 boxSize = vec3(0.5294, 0.100, 0.500);

    // Rotate the box around the Y-axis
    float rotationAngle = 4.0 * sin(iTime);
    mat2 rotationMatrix = mat2(
        cos(rotationAngle), sin(rotationAngle),
        -sin(rotationAngle), cos(rotationAngle)
    );
    normalizedCoord = rotationMatrix * normalizedCoord;

    // Check if the fragment is inside the box
    if (abs(normalizedCoord.x) <= boxSize.x &&
        abs(normalizedCoord.y) <= boxSize.y)
    {
        fragColor = vec4(boxColor, 1.0); // Set the box color
    }
    else
    {
        fragColor = vec4(1.0); // White space outside the box
    }
}