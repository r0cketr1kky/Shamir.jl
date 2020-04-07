using Shamir, Polynomials, Test

@info "Testing creation of shares"
prod_coeffs = [1234, 166, 94]
n = 6
prod_poly = Poly(prod_coeffs)
shares = Shamir.construct_shares(n, prod_poly)
@test shares == [[1, 1494], [2, 1942], [3, 2578], [4, 3402], [5, 4414], [6, 5614]]


@info "Testing Recover secret"
prod_coeffs = [1234, 166, 94]
n = 6 #total number of parties
k = 3 #min num of shares
p = 1613 #field
prod_poly = Poly(prod_coeffs)
shares = Shamir.construct_shares(n, prod_poly)
secret = Shamir.recover_secret(shares, n, k, p)
@test secret == 1234.0

@info "All tests completed"
