require('codecompanion').setup {

  adapters = {
    http = {
      openwebui = function()
        return require('codecompanion.adapters').extend('openai_compatible', {
          env = {
            url = 'http://172.17.30.3:3000/api',
            api_key = 'sk-b759f2c500a4448ab64c6a94851b3303',
          },
          schema = {
            model = {
              default = 'gpt-oss:120b', -- Replace with the model name available in Open WebUI
            },
          },
        })
      end,
    },
  },
  strategies = {
    chat = { adapter = 'openwebui' },
    inline = { adapter = 'openwebui' },
  },
}
