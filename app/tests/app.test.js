const request = require("supertest");
const app = require("../src/app");

describe("App health checks", () => {
  test("GET / should return 200", async () => {
    const res = await request(app).get("/");
    expect(res.statusCode).toBe(200);
    expect(res.body.message).toBe("Node.js ECS app is running");
  });

  test("GET /health should return 200", async () => {
    const res = await request(app).get("/health");
    expect(res.statusCode).toBe(200);
    expect(res.body.status).toBe("ok");
  });
});