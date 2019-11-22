process.env.NODE_ENV = process.env.NODE_ENV || 'development'
//process.env.ALGOLIA_SEARCH_KEY = '36c3e937288c0d983a00bf1b4f4fe435';

const environment = require('./environment')

module.exports = environment.toWebpackConfig()
