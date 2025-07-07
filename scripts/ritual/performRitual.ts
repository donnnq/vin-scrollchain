import { JsonRpcProvider, Contract, isAddress } from "ethers";
import fs from "fs";

// Load ABI from artifacts
const abi = JSON.parse(
  fs.readFileSync("artifacts/contracts/rituals/ScrollKeeper.sol/ScrollKeeper.json", "utf-8")
).abi;

// Replace this with your actual deployed address
const KEEPER_ADDRESS = "0x0165878A594ca255338adfa4d48449f69242Eb8F";

async function main() {
  if (!isAddress(KEEPER_ADDRESS)) {
    throw new Error(`❌ Invalid ScrollKeeper address: ${KEEPER_ADDRESS}`);
  }

  // Connect to local Hardhat node
  const provider = new JsonRpcProvider("http://127.0.0.1:8545");
  const [signerAddress] = await provider.listAccounts();
  const signer = await provider.getSigner(0);

  // Connect to contract
  const keeper = new Contract(KEEPER_ADDRESS, abi, signer);

  // Perform ritual
  const tx = await keeper.performRitual("🌅 VIN's scrollchain awakens");
  const receipt = await tx.wait();

  console.log("✅ Ritual performed.");
  console.log("📜 Transaction hash:", receipt.hash);
}

main().catch((error) => {
  console.error("❌ Ritual failed:", error);
  process.exitCode = 1;
});
