module DeprecationBotTest

function foobar{T}(x, y::T)
    println(x, y)
end

if !(isdefined(Core, :String) && isdefined(Core, :AbstractString))
    function jlconvert(T::Union{Type{Compat.ASCIIString},Type{Compat.UTF8String}}, ::JldFile, ptr::Ptr)
        strptr = unsafe_load(convert(Ptr{Ptr{UInt8}}, ptr))
        n = Int(ccall(:strlen, Csize_t, (Ptr{UInt8},), strptr))
        T(unsafe_wrap(Array, strptr, n, true))
    end
end

if VERSION >= v"0.1.0"
    _foo(x) = foo(x)
else
    _foo(x) = foo(x)
end

bar(x) = _foo(x)

function foobar{T}(a,
               b::T,
               c::T)
    (a, b, c)    
end

end # module
