void mainImage(out vec4 fragColor, in vec2 fragCoord)
{
    // Define the resolution of the screen
    vec2 resolution = iResolution.xy;

    // Define the center of the white space
    vec2 center = resolution * 0.5;

    // Define the number of circles
    const int numCircles = 10;

    // Calculate the angle increment for rotation
    float angleIncrement = 2.0 * 3.14159 / float(numCircles);

    // Calculate the time for animation
    float time = iTime;

    // Calculate the color based on time
    vec3 color = 0.5 + 0.5 * cos(time * 0.5 + vec3(0.0, 2.0, 4.0));

    // Calculate the radius of the circles
    float radius = 0.3 * resolution.y;

    // Loop through each circle
    for (int i = 0; i < numCircles; i++)
    {
        // Calculate the angle for the current circle
        float angle = float(i) * angleIncrement + time;

        // Calculate the position of the circle
        vec2 position = center + vec2(cos(angle), sin(angle)) * radius;

        // Calculate the distance from the current fragment to the circle
        float distance = length(fragCoord - position);

        // Calculate the radius of the circle
        float circleRadius = 0.06 * resolution.x;

        // Check if the fragment is inside the circle
        if (distance < circleRadius)
        {
            // Set the color of the fragment to the circle color
            fragColor = vec4(color, 0.11);
            return;
        }
    }

    // Set the color of the fragment to white if not inside any circle
    fragColor = vec4(1.0);
}