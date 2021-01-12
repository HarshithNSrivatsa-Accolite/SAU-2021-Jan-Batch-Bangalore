function digit_same(n) 
{
    let rem = n % 10;
    while (n) 
    {
      if (n % 10 !== rem) 
            return false;
            
    n = Math.floor(n/ 10);
    }
    return true
  }