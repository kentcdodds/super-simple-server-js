require("http")
  .createServer((_, r) => {
    r.write("Hello, world!");
    r.end();
  })
  .listen(process.env.PORT);
