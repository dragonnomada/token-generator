const crypto = require("crypto")
const http = require("http")
const express = require("express")

const { version } = require("./package.json")

const app = express()

app.all("/", (request, response) => {
    response.send(crypto.randomUUID())
})

app.all("/version", (request, response) => {
    response.send(version)
})

app.all("/token", (request, response) => {
    const { n } = request.query
    const size = Number(n || "8") || 8
    let token = ""
    while (token.length < size) token += crypto.randomUUID().replace(/\-/g, "")
    token = token.slice(0, size)
    response.send(token)
})

const server = http.createServer(app)

server.listen(3000, () => {
    console.log("Server started at http://localhost:3000/")
})