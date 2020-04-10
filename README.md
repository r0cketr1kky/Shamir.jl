# Shamir.jl
An implementation of Shamir's Secret Sharing protocol in Julia

[![Build Status](https://travis-ci.com/r0cketr1kky/Shamir.jl.svg?branch=master)](https://travis-ci.com/r0cketr1kky/Shamir.jl)

This project aims to aid users in distributing random shares, without sharing the secret. <br/>

For more details, [Shamir's Secret Sharing Scheme](https://en.wikipedia.org/wiki/Shamir's_Secret_Sharing#Shamir.27s_secret-sharing_scheme)<br/>

## Installation

```julia
Pkg.add("Shamir")
```

## Usage

In Julia

```julia
using Shamir, Polynomials
n = 6
poly_production = Poly([1234, 166, 94])
shares = Shamir.construct_shares(n, poly_production)
secret = Shamir.reconstruct_secret(shares)
```
