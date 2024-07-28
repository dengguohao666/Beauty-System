const { defineConfig } = require('@vue/cli-service')
module.exports = ({
  devServer: {
    proxy: {
      '/api': {
        target: 'http://localhost:10086',
        changeOrigin: true,
        pathRewrite: {
          '^/api': ''
        }
      }
    }
  }
})
