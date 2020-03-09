const devcert = require('devcert');
const domain = process.argv[2];
const fs = require('fs');

const makeFile = (name, content) => {
    fs.writeFile(name, content, err => {
        if (err) throw err;
        console.log(`${name} CREATED SUCCESSFULLY`);
    });
};
const ssl = async function (domain) {
    const s = await devcert.certificateFor(domain);
    makeFile(`./local-ssl/server.crt`, s.cert);
    makeFile(`./local-ssl/server.key`, s.key);
};
ssl(domain);
