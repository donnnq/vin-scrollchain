import { ethers } from "hardhat";

async function main() {
  // 🫀 Deploy ScrollHeartbeat
  const Heartbeat = await ethers.getContractFactory("ScrollHeartbeat");
  const heartbeat = await Heartbeat.deploy();

  // 📖 Deploy ScrollLogbook
  const Logbook = await ethers.getContractFactory("ScrollLogbook");
  const logbook = await Logbook.deploy();

  // 🔁 Deploy ScrollRotation
  const Rotation = await ethers.getContractFactory("ScrollRotation");
  const rotation = await Rotation.deploy();

  // 🧙 Deploy ScrollKeeper with dependencies
  const Keeper = await ethers.getContractFactory("ScrollKeeper");
  const keeper = await Keeper.deploy(
    heartbeat.target,
    logbook.target,
    rotation.target
  );

  // 🖨️ Log deployed addresses
  console.log("✅ ScrollHeartbeat:", heartbeat.target);
  console.log("✅ ScrollLogbook:", logbook.target);
  console.log("✅ ScrollRotation:", rotation.target);
  console.log("✅ ScrollKeeper:", keeper.target);
}

main().catch((error) => {
  console.error("❌ Deployment failed:", error);
  process.exitCode = 1;
});
