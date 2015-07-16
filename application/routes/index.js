module.exports = function(app) {
  var rout;
  rout = {
    home: {
      type: 'get',
      link: '/',
      control: function(req, res) {
        console.log(app);
        res.render('index', {
          title: 'iBuilder'
        });
      }
    },
    about: {
      type: 'get',
      link: '/about',
      control: function(req, res) {
        console.log('Page about');
      }
    }
  };
  return rout;
};
