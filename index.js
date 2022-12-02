const express = require('express')
const app = express()
const port = 8080

app.get('/', (req, res) => {
  res.send('Hello World!')
})

app.listen(port, () => {

  const url = 'https://' + process.env.CODESPACE_NAME + '-' + port + '.' + process.env.GITHUB_CODESPACES_PORT_FORWARDING_DOMAIN
  console.log(`Example app listening @ ${url}`)
})
