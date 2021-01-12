function prime_factors(n) {

    const ans = [];

    function is_prime(num) {
      for (let i = 2; i <= Math.sqrt(num); i++)
      {
        if (num % i === 0) return false;
      }
      return true;
    }
    
    for (let i = 2; i <= n; i++)
    {
      while (is_prime(i) && n % i === 0) 
      {
        if (!ans.includes(i)) 
            ans.push(i);

        n /= i;
      }
    }
    return ans;
  }