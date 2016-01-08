      $(function() {
        $('[rel=popover]').popover(
          {
            html : true, 
            content: function() {
              return $('#information').html();
            }/*,
            title: function() {
              return $('#popoverExampleTwoHiddenTitle').html();
            }*/
          }
        );
      });
