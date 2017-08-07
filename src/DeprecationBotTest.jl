module DeprecationBotTest

function foobar(x, y::T) where T
    println(x, y)
end

if !(isdefined(Core, :String) && isdefined(Core, :AbstractString))
    function jlconvert(T::Union{Type{String},Type{String}}, ::JldFile, ptr::Ptr)
        strptr = unsafe_load(convert(Ptr{Ptr{UInt8}}, ptr))
        n = Int(ccall(:strlen, Csize_t, (Ptr{UInt8},), strptr))
        T(unsafe_wrap(Array, strptr, n, true))
    end
end

_foo(x) = foo(x)

bar(x) = _foo(x)

function foobar(a,
            b::T,
            c::T) where T
    (a, b, c)    
end

end # module
