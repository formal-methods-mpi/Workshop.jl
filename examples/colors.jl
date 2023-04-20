struct RGB
    r # Red in [0,1]
    g # Green in [0,1]
    b # Blue in [0,1]
    function RGB(r, g, b)
        if (r < 0) | (r > 1) | (g < 0) | (g > 1) | (b < 0) | (b > 1)
            error("red, green and blue values outside bounds")
        end
        return new(r, g, b)
    end
end

using Colors

import Base: zero, +, -, *

complement(c::RGB) = RGB(1 - c.r, 1 - c.g, 1 - c.b)

zero(::Type{RGB}) = RGB(0.0, 0.0, 0.0)
zero(x::RGB) = RGB(0.0, 0.0, 0.0)

+(c::RGB, d::RGB) = 
    RGB(
        (c.r + d.r)/2, 
        (c.g + d.g)/2, 
        (c.b + d.b)/2)

a = RGB(1.0, 0.2, 0.5)
b = RGB(0.3, 0.6, 0.43)

zero(a)

a+b

[a, b, a+b]

v1 = rand(RGB, 10)
v2 = rand(RGB, 10)

v1 + v2

[v1 v2 v1+v2]