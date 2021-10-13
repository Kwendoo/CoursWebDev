function afficheHeure()
    {
        var span = document.getElementById("horloge");
        if (span==null) return; 
        var d = new Date();
        span.appendChild(document.createTextNode(d.getHours()));

        var s = span.appendChild(document.createElement("span"));
        s.setAttribute("style", "color:#aaaaaa;");
        s.appendChild(document.createTextNode(":"));

        span.appendChild(document.createTextNode(d.getMinutes()));

        var s = span.appendChild(document.createElement("span"));
        s.setAttribute("style", "color:#aaaaaa;");
        s.appendChild(document.createTextNode(":"));

        span.appendChild(document.createTextNode(d.getSeconds()));
    }