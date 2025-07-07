const { expect } = require("chai");

describe("ScrollBlessing", function () {
  it("should set and get blessing", async function () {
    const [owner] = await ethers.getSigners();
    const ScrollBlessing = await ethers.getContractFactory("ScrollBlessing");
    const scroll = await ScrollBlessing.deploy();
    await scroll.setBlessing("Blessed be the chain");

    expect(await scroll.getBlessing()).to.equal("Blessed be the chain");
  });
});
