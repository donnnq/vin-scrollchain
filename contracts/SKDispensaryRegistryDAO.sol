// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title SKDispensaryRegistryDAO
 * @dev Emotionally tagged smart contract to log youth-led dispensary operations,
 * purok licensing, and SK badge rituals — scrollchain-sealed governance.
 */

contract SKDispensaryRegistryDAO {
    address public steward;

    struct Dispensary {
        address initiator;
        string purok;
        string licenseID;
        string badgeLevel; // "Basic", "Advanced", "Legendary"
        string emotionalTag;
        uint256 timestamp;
    }

    Dispensary[] public entries;

    event DispensaryLogged(address indexed initiator, string purok, string licenseID, string badgeLevel, string emotionalTag, uint256 timestamp);

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log SK dispensary rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logDispensary(address initiator, string memory purok, string memory licenseID, string memory badgeLevel, string memory emotionalTag) external onlySteward {
        entries.push(Dispensary({
            initiator: initiator,
            purok: purok,
            licenseID: licenseID,
            badgeLevel: badgeLevel,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit DispensaryLogged(initiator, purok, licenseID, badgeLevel, emotionalTag, block.timestamp);
    }

    function getDispensaryByIndex(uint256 index) external view returns (address initiator, string memory purok, string memory licenseID, string memory badgeLevel, string memory emotionalTag, uint256 timestamp) {
        require(index < entries.length, "Scrollstorm index out of bounds");
        Dispensary memory d = entries[index];
        return (d.initiator, d.purok, d.licenseID, d.badgeLevel, d.emotionalTag, d.timestamp);
    }
}
