const { nodes } = require("node-red");

//设备全局化
function devices(){
    let devices = global.get("devices") ;
    let setDevice = (did, device, gateway) => {
        if (devices[did] && devices[did].gid) {
            node.error("设备编号重复：" + did);
            node.warn(devices[did]);
            node.warn(gateway);
            return;
        }
        device.did = did;
        device.gid = gateway ? gateway.did : null
        device.gateway = gateway;
        devices[did] = device;

        let subdevs = device.devices;
        if (subdevs) {
            let subkeys = Object.keys(subdevs);
            subkeys.forEach(subkey => {
                let subdev = subdevs[subkey];
                setDevice(subkey, subdev, device);            
            });        

        }
    }



    let keys = Object.keys(devices);
    keys.forEach(key => {
        let device = devices[key];
        setDevice(key, device)
        
    });
}

//终端上行登记检查

function deviceRegCheck() {
    if (msg.payload.hd) {
        let did = msg.payload.hd.did;
        let device = global.get("devices")[did];
        if (device) {
            msg.payload.hd.gid = device.gid
        } else {
            node.error("设备未登记：" + did);
            return;
        }
    }    
}

//VR体验馆空调数据格式转换
function VRTYG_Parse() {
    let pld = msg.payload.pld;
    let extra = pld.extra;
    let Mode = {"0": "cool","1": "dry","2": "auto","3": "heat","4": "fan_only"};
    let Fan = {"0": "auto","1": "high","2": "medium","4":"low", "5": "auto"};

    if (extra) {
        extra = extra.toLowerCase();
        extra = extra.replace("Mesg Desc.:".toLowerCase(), "");
        let items = extra.split(",");
        items.forEach(item => {
            let _item = item.split(":");
            let key = _item[0].trim();
            let value = _item[1].trim();
            switch(key) {
                case "power":
                    pld.power = value;                    
                    break;
                case "temp":                    
                    value = value.substr(0, value.length -1)                    
                    pld.temperature = parseInt(value);
                    break;
                case "mode":
                    pld.mode = Mode[value[0]];
                    break;
                case "fan":
                    pld.fanSpeed = Fan[value[0]];                   
                    break;
                case "zone follow":
                
                    break;     
                case "sensor temp":
            
                    break;                          
                                  
            }
        })
    }

    return msg;
}