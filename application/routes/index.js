module.exports = function(app) {
  var rout;
  rout = {
    home: {
      type: 'get',
      link: '/',
      control: function(req, res) {
        HomeController.run(req, res);
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
