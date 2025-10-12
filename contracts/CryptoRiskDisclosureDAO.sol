// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title CryptoRiskDisclosureDAO
 * @dev Emotionally tagged smart contract to log crypto risk warnings,
 * volatility disclosures, and investor protection gaps — scrollchain-sealed caution.
 */

contract CryptoRiskDisclosureDAO {
    address public steward;

    struct Risk {
        address initiator;
        string asset;
        string riskType;
        string emotionalTag;
        uint256 timestamp;
    }

    Risk[] public risks;

    event CryptoRiskLogged(address indexed initiator, string asset, string riskType, string emotionalTag, uint256 timestamp);

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log crypto risks");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logRisk(address initiator, string memory asset, string memory riskType, string memory emotionalTag) external onlySteward {
        risks.push(Risk({
            initiator: initiator,
            asset: asset,
            riskType: riskType,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit CryptoRiskLogged(initiator, asset, riskType, emotionalTag, block.timestamp);
    }

    function getRiskByIndex(uint256 index) external view returns (address initiator, string memory asset, string memory riskType, string memory emotionalTag, uint256 timestamp) {
        require(index < risks.length, "Scrollstorm index out of bounds");
        Risk memory r = risks[index];
        return (r.initiator, r.asset, r.riskType, r.emotionalTag, r.timestamp);
    }
}
