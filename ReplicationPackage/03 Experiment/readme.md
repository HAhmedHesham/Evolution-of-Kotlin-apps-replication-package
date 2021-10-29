# Setup experiment variables
To run the experiment two settings must be adjusted in the config.json file. 

Firstly, each URL in the 'paths' parameter must be adjusted to the local IP adress of the Raspberry Pi, including the Port number specified in the Flask server.

Secondly, if new webpage URLs are added to the list they must be injected with the updated PerfumeJS script.

## Requirements
Throttling network speed  
Running Flask Server

## Usage
### Throttling network speed
The network speed of the Raspberry Pi is throttled at 20mbps using Wondershaper, Wondershaper can be installed and enabled using the following commands:

```cli
git clone https://github.com/magnific0/wondershaper.git
cd wondershaper
sudo /home/pi/external_memory/wondershaper/wondershaper -a eth0 -d 20480 -u 20480
```

### Flask server requirements
Each URL must be of the following syntax: ``Local-IP-Address:PortNumber/path/to/index.html``

Within the index.html the following script must be added in the ``<head>`` tag:

``<script src="/node_modules/perfume.js/dist/perfume.umd.min.js"></script>``
    
    <script>
        perfumeResults = [];
        loadtimeResult = [];
        function xml_http_post(url, data, callback) {var req = new XMLHttpRequest(); req.open("POST", url, true); 
        req.send(data);} 
        const perfume = new Perfume({  analyticsTracker: (options) => {    const { metricName, data, eventProperties, navigatorInformation } = options; 
        perfumeResults.push(options); } });
        function load_log() {
        // calculate loadTime based on diff between when DOM is loaded and navigation was started
        var loadTime = window.performance.timing.domContentLoadedEventEnd- window.performance.timing.navigationStart;
        loadtimeResult.push({'loadTime': loadTime})
        setTimeout(function(){ objectToSend = "{'perfumeResults':"+JSON.stringify(perfumeResults)+JSON.stringify(loadtimeResult)+"}"; 
        xml_http_post("http://192.168.0.243:8080/",objectToSend,null); },5000); };
        window.addEventListener ?window.addEventListener("load",load_log, true) : window.attachEvent && window.attachEvent("onload", load_log);
    </script>
