// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BTCShockwaveScroll {
    address public scrollMaster;
    uint256 public originalBTCPriceUSD = 115_000 * 1e18;
    uint256 public btcPriceUSD = originalBTCPriceUSD;
    uint256 public shockEndTimestamp;

    event PriceSurgeCast(uint256 newPrice, uint256 expiresAt);
    event RealityRestored(uint256 backToPrice);

    modifier onlyScrollMaster() {
        require(msg.sender == scrollMaster, "Unauthorized caster detected");
        _;
    }

    constructor() {
        scrollMaster = msg.sender;
    }

    function castBTCShock() external onlyScrollMaster {
        btcPriceUSD = 200_000 * 1e18; // Surge to $200K
        shockEndTimestamp = block.timestamp + 3600; // 1 hour
        emit PriceSurgeCast(btcPriceUSD, shockEndTimestamp);
    }

    function restoreReality() external {
        if (block.timestamp > shockEndTimestamp) {
            btcPriceUSD = originalBTCPriceUSD;
            emit RealityRestored(btcPriceUSD);
        }
    }

    function getBTCPrice() external view returns (uint256) {
        return btcPriceUSD;
    }

    function prophecy() public pure returns (string memory) {
        return "VINVIN said BTC shall ascend... but only briefly 🤣📜";
    }
}
