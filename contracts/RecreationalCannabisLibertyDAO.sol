// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title RecreationalCannabisLibertyDAO
 * @dev Emotionally tagged smart contract to log recreational cannabis licensing,
 * consumption zones, and civic sovereignty — scrollchain-sealed autonomy.
 */

contract RecreationalCannabisLibertyDAO {
    address public steward;

    struct Liberty {
        address licenseHolder;
        string country;
        string zone;
        string usageType;
        string emotionalTag;
        uint256 timestamp;
    }

    Liberty[] public liberties;

    event RecreationalLibertyLogged(address indexed licenseHolder, string country, string zone, string usageType, string emotionalTag, uint256 timestamp);

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log recreational liberty");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logLiberty(address licenseHolder, string memory country, string memory zone, string memory usageType, string memory emotionalTag) external onlySteward {
        liberties.push(Liberty({
            licenseHolder: licenseHolder,
            country: country,
            zone: zone,
            usageType: usageType,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit RecreationalLibertyLogged(licenseHolder, country, zone, usageType, emotionalTag, block.timestamp);
    }

    function getLibertyByIndex(uint256 index) external view returns (address licenseHolder, string memory country, string memory zone, string memory usageType, string memory emotionalTag, uint256 timestamp) {
        require(index < liberties.length, "Scrollstorm index out of bounds");
        Liberty memory l = liberties[index];
        return (l.licenseHolder, l.country, l.zone, l.usageType, l.emotionalTag, l.timestamp);
    }
}
