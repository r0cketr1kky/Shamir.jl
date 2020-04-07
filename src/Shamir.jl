module Shamir

using Polynomials

function l(x, j, k)
"""
    Create a Lagrange basis polynomial
    Reference: https://wikimedia.org/api/rest_v1/media/math/render/svg/6e2c3a2ab16a8723c0446de6a30da839198fb04b
""" 
    polys = []
    for m in 1:k       
        if m != j
            d = x[j] - x[m]
            r = Poly([-1 * x[m], 1]) / d
            push!(polys, r)            
        end
    end
        
    #println(polys)
    
    return prod(polys)
end

function L(x, y, k)
"""
    Create a linear combination of Lagrange basis polynomials
    Reference: https://wikimedia.org/api/rest_v1/media/math/render/svg/d07f3378ff7718c345e5d3d4a57d3053190226a0
"""
    
    s = []
    
    for j in 1:k
        r = y[j] * l(x, j, k)
        push!(s, r)
    end
    
    #println(sum(s))
    
    return sum(s)
end

function construct_shares(n, production_poly)
"""
    Create shares of the secret
    
    Parameters:
    production_poly : The Polynomial created with the secret
                    to produce secret shares
"""
    
    share = []
    
    for i in 1:n
        push!(share, [i, production_poly(i)])
    end
    
    return share
end

function recover_secret(shares)
"""
    Recover the secret by finding the coefficient of x^0 i.e.
    when the x=0 in the polynomial. 
    
    Parameters:
    shares : An array of shares of the individuals.
"""
    if length(shares) < k
        throw("Need more parties!")
    end
    
    x = []
    y = []
    for i in 1:n
        push!(x, shares[i][1])
        push!(y, shares[i][2])
    end
    
    f = L(x, y, k)
    f = mod(f(0), p)
    
    return f
end

export Shamir

end
