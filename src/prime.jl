function prime(nth)
    size_factor = 2
    total_primes = 0
    s = nth * size_factor
    while total_primes < nth
        primes = get_prime(s)
        total_primes = sum(primes[2:s])
        size_factor = size_factor + 1
        s = (nth * size_factor)
    end
    return count_primes(primes, nth)
end

function get_prime(s)    
    primes = ones(Int64, s)
    for i = 2:s
        if primes[i] == 1
            for j = i:s
                if (i*j) < s
                    primes[i*j] = 0
                else
                    break
                end
            end
        end 
    end
    primes
end

function count_primes(primes, nth)
    count = 0
    for k = 2:length(primes)
        count += primes[k]
        if count == nth
            return k
        end
    end
end