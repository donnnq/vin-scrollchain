// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title StablecoinLiquidityTrackerDAO
 * @dev Emotionally tagged smart contract to log stablecoin supply,
 * dry powder reserves, and re-entry signals — scrollchain-sealed liquidity.
 */

contract StablecoinLiquidityTrackerDAO {
    address public steward;

    struct LiquidityEvent {
        address initiator;
        string stablecoin;
        uint256 supplyAmount;
        string signalType; // e.g. "Accumulation", "Re-entry", "Exit"
        string emotionalTag;
        uint256 timestamp;
    }

    LiquidityEvent[] public events;

    event LiquidityLogged(address indexed initiator, string stablecoin, uint256 supplyAmount, string signalType, string emotionalTag, uint256 timestamp);

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log stablecoin liquidity");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logLiquidity(address initiator, string memory stablecoin, uint256 supplyAmount, string memory signalType, string memory emotionalTag) external onlySteard {
        events.push(LiquidityEvent({
            initiator: initiator,
            stablecoin: stablecoin,
            supplyAmount: supplyAmount,
            signalType: signalType,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit LiquidityLogged(initiator, stablecoin, supplyAmount, signalType, emotionalTag, block.timestamp);
    }

    function getLiquidityByIndex(uint256 index) external view returns (address initiator, string memory stablecoin, uint256 supplyAmount, string memory signalType, string memory emotionalTag, uint256 timestamp) {
        require(index < events.length, "Scrollstorm index out of bounds");
        LiquidityEvent memory l = events[index];
        return (l.initiator, l.stablecoin, l.supplyAmount, l.signalType, l.emotionalTag, l.timestamp);
    }
}
