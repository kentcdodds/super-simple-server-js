import { Server } from "https://deno.land/std@0.170.0/http/server.ts";

new Server({
  port: Number(Deno.env.get("PORT")),
  handler: (request) => new Response("Hello, world!", { status: 200 }),
}).listenAndServe();
