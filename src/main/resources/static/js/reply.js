

var replyService = (function() {
kospilist=[];
datelist=[];
        $.ajax({
            url: "http://localhost:8080/re/get",
            dataType: "json",
            success: function (data) {
              for( var i in data)
              {
                  kospilist.push(data[i].kospi);
                  datelist.push(data[i].date);
              }

            }
        });
    return {


    }
})();

