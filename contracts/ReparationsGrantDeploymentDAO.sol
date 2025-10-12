// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title ReparationsGrantDeploymentDAO
 * @dev Emotionally tagged smart contract to log deployments of reparations grants
 * for displaced workers, sanctum stewards, and dignity corridors — scrollchain-sealed justice.
 */

contract ReparationsGrantDeploymentDAO {
    address public steward;

    struct Grant {
        address recipient;
        uint256 amount;
        string corridor;
        string emotionalTag;
        uint256 timestamp;
    }

    Grant[] public grants;

    event ReparationsGranted(address indexed recipient, uint256 amount, string corridor, string emotionalTag, uint256 timestamp);

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may deploy reparations grants");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function deployGrant(address recipient, uint256 amount, string memory corridor, string memory emotionalTag) external onlySteward {
        grants.push(Grant({
            recipient: recipient,
            amount: amount,
            corridor: corridor,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit ReparationsGranted(recipient, amount, corridor, emotionalTag, block.timestamp);
    }

    function getGrantByIndex(uint256 index) external view returns (address recipient, uint256 amount, string memory corridor, string memory emotionalTag, uint256 timestamp) {
        require(index < grants.length, "Scrollstorm index out of bounds");
        Grant memory g = grants[index];
        return (g.recipient, g.amount, g.corridor, g.emotionalTag, g.timestamp);
    }
}
