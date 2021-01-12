
function change_case(str) {

    var ans = '';

    for (var i = 0; i < str.length; i++) {

        if (str.charAt(i) === str.charAt(i).toLowerCase()) {
            ans += str.charAt(i).toUpperCase();
        } 
        
        else if (str.charAt(i) === str.charAt(i).toUpperCase()) {
            ans += str.charAt(i).toLowerCase()
        } 
        
        else {
            ans += str.charAt(i);
        }
    }
    return ans;
}