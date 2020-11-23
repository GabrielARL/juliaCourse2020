struct Angle 
    θ::Float64
end

Base.:+(a1::Angle, a2::Angle) = Angle(mod(a1.θ + a2.θ, 2π))
Base.:-(a1::Angle, a2::Angle) = Angle(mod(a1.θ - a2.θ, 2π))
Base.:*(k, a::Angle) = Angle(mod(k * a.θ, 2π))

inradians(a::Angle) = a.θ
indegrees(a::Angle) = rad2deg(a.θ)

const ° = Angle(deg2rad(1.0))

Base.show(io::IO, a::Angle) = print(io, "$(round(rad2deg(a.θ); digits = 3))°")

######
struct CIntA 
    value::Int64
    m::Int64
end

Base.:+(a1::CIntA, a2) = CIntA(mod(a1.value -1 + a2, a.m)+1, a.m)
Base.:-(a1::CIntA, a2) = CIntA(mod(a1.value -1 - a2, a.m)+1, a.m)
Base.to_index(a::CIntA) = a.value

i = CInt10(5)
@assert i + 5 == CInt10(10)
@assert i + 7 == CInt10(2)

struct  CIntB{M} 
i::Int64
end

Base.:+(a::CIntB{M}, n) where M = CIntB{M}(mod(a.i -1 + n, M) + 1)

