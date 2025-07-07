import { JsonRpcProvider, Contract, isAddress } from "ethers";
import fs from "fs";

// Load ABI from artifacts
const abi = JSON.parse(
  fs.readFileSync("artifacts/contracts/ScrollKeeper.sol/ScrollKeeper.json", "utf-8")
).abi;

async function main() {
  const deployments = JSON.parse(fs.readFileSync("deployments/localhost.json", "utf-8"));
  const keeperAddress = deployments?.localhost?.ScrollKeeper;

  if (!keeperAddress || !isAddress(keeperAddress)) {
    throw new Error(`❌ Invalid ScrollKeeper address: ${keeperAddress}`);
  }

  // Connect to local Hardhat node
  const provider = new JsonRpcProvider("http://127.0.0.1:8545");
  const [signerAddress] = await provider.listAccounts();
  const signer = await provider.getSigner(signerAddress);

  // Connect to contract
  const keeper = new Contract(keeperAddress, abi, signer);

  // Perform ritual
  const tx = await keeper.performRitual();
  const receipt = await tx.wait();

  console.log("✨ Ritual performed!");
  console.log("📜 Transaction hash:", receipt.hash);
}

main().catch((error) => {
  console.error("❌ Ritual failed:", error);
  process.exitCode = 1;
});
