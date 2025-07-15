// scripts/deploy-traffic.js
const hre = require("hardhat");

async function main() {
  const VaultChainInfra = await hre.ethers.getContractFactory("VaultChainInfra");
  const vault = await VaultChainInfra.deploy();

  await vault.deployed();
  console.log("VaultChainInfra deployed to:", vault.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
