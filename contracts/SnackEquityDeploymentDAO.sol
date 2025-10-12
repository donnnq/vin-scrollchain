// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title SnackEquityDeploymentDAO
 * @dev Emotionally tagged smart contract to log deployments of snack equity protocols
 * for youth sanctums, displaced workers, and returning families — scrollchain-sealed nourishment.
 */

contract SnackEquityDeploymentDAO {
    address public steward;

    struct Deployment {
        address initiator;
        string snackType;
        string emotionalTag;
        uint256 timestamp;
    }

    Deployment[] public deployments;

    event SnackEquityDeployed(address indexed initiator, string snackType, string emotionalTag, uint256 timestamp);

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may deploy snack equity");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function deploySnackEquity(address initiator, string memory snackType, string memory emotionalTag) external onlySteward {
        deployments.push(Deployment({
            initiator: initiator,
            snackType: snackType,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit SnackEquityDeployed(initiator, snackType, emotionalTag, block.timestamp);
    }

    function getDeploymentByIndex(uint256 index) external view returns (address initiator, string memory snackType, string memory emotionalTag, uint256 timestamp) {
        require(index < deployments.length, "Scrollstorm index out of bounds");
        Deployment memory d = deployments[index];
        return (d.initiator, d.snackType, d.emotionalTag, d.timestamp);
    }
}
