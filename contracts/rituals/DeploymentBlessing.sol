// SPDX-License-Identifier: Scrollsmith-Ritual
pragma solidity ^0.8.0;

contract DeploymentBlessing {
    address public steward;
    uint256 public blessingFee = 0.005 ether;

    struct BlessingLog {
        bytes32 scrollName;
        address deployedBy;
        string location;
        string prophecy;
        uint256 timestamp;
    }

    BlessingLog[] public blessings;

    event BlessingLogged(bytes32 indexed scrollName, address indexed deployedBy, string location, string prophecy, uint256 timestamp);

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logBlessing(bytes32 scrollName, string memory location, string memory prophecy) external payable {
        require(msg.value >= blessingFee, "Insufficient blessing offering");

        blessings.push(BlessingLog({
            scrollName: scrollName,
            deployedBy: msg.sender,
            location: location,
            prophecy: prophecy,
            timestamp: block.timestamp
        }));

        emit BlessingLogged(scrollName, msg.sender, location, prophecy, block.timestamp);
    }

    function getBlessing(uint256 index) external view returns (BlessingLog memory) {
        require(index < blessings.length, "Invalid index");
        return blessings[index];
    }

    function updateBlessingFee(uint256 newFee) external onlySteward {
        blessingFee = newFee;
    }

    function updateSteward(address newSteward) external onlySteward {
        steward = newSteward;
    }
}
