const http = require("http")

process.on('uncaughtException', (error)=>{
    // console.log(error)

})
process.on('unhandledRejection',  (error)=>{

})

for (let index = 2; index < 253; index++){
    const url = "http://192.168.1." + index+ ":1880";

    try {
        http.get(url, (res) => {
            const { statusCode } = res;
            if (statusCode == 200) {
                console.log(url)
            } else {
                console.log(index + statusCode)
            }
        });
    } catch (error) {
            
    }   
}

