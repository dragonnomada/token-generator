const crypto = require("crypto")
const http = require("http")
const express = require("express")

const { version } = require("./package.json")

const mode = process.env.DEPLOY_MODE

const app = express()

app.all("/", (request, response) => {
    let token = ""

    {
        const { n } = request.query
        const size = Number(n)
        if (size > 0) {
            while (token.length < size) token += crypto.randomUUID().replace(/\-/g, "")
            token = token.slice(0, size)
        }
    }

    response.send({
        version,
        mode,
        uuid: crypto.randomUUID(),
        token,
        at: new Date(),
        local: new Date().toLocaleString()
    })
})

app.all("/version", (_, response) => {
    response.send(`Version: ${version} (${mode})\n`)
})

const server = http.createServer(app)

server.listen(80, "0.0.0.0", () => {
    console.log("Server started at http://localhost:80/")
})