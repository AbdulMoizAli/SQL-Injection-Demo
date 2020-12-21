"use strict";

const express = require("express");
const path = require("path");
const mssql = require("mssql");
const dbConfig = require("./config/dbConfig");

const app = express();

app.use(express.static(path.join(__dirname, "public")));
app.use(express.json());

app.post("/movies", async (req, res) => {

    try {
        var connection = await mssql.connect(dbConfig);
        const result = await mssql.query(`SELECT * FROM Movie WHERE Title LIKE '%${req.body.title}%'`);

        if (result.recordset.length === 0)
            res.status(404).json({
                message: "No Movie Found"
            });
        else
            res.status(200).json(result.recordset);
    } catch (error) {
        res.status(500).json({
            message: "Internal Server Error",
        });
    } finally {
        if (connection)
            connection.close();
        else
            res.status(500).json({
                message: "Internal Server Error",
            });
    }
});

app.use((req, res) => {
    res.sendFile(path.join(__dirname, "public", "404.html"));
});

const port = process.env.PORT || 3000;
app.listen(port, () => console.log(`Listening on port 3000`));