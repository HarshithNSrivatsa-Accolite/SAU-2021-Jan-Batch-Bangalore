function sum_of_digits(str)
{
    let s = str.split("");
    let ans=0;

	for(let i=0;i<s.length;i++){
        
        if(!isNaN(s[i])){

			ans+=parseInt(s[i]);
		}
	}
	return ans;
}