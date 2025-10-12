// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title CannabisLicensingClarityDAO
 * @dev Emotionally tagged smart contract to log licensing frameworks,
 * reform signals, and emotional tags per jurisdiction — scrollchain-sealed clarity.
 */

contract CannabisLicensingClarityDAO {
    address public steward;

    struct License {
        address issuer;
        string country;
        string licenseType;
        string emotionalTag;
        uint256 timestamp;
    }

    License[] public licenses;

    event LicensingLogged(address indexed issuer, string country, string licenseType, string emotionalTag, uint256 timestamp);

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log licensing clarity");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logLicense(address issuer, string memory country, string memory licenseType, string memory emotionalTag) external onlySteward {
        licenses.push(License({
            issuer: issuer,
            country: country,
            licenseType: licenseType,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit LicensingLogged(issuer, country, licenseType, emotionalTag, block.timestamp);
    }

    function getLicenseByIndex(uint256 index) external view returns (address issuer, string memory country, string memory licenseType, string memory emotionalTag, uint256 timestamp) {
        require(index < licenses.length, "Scrollstorm index out of bounds");
        License memory l = licenses[index];
        return (l.issuer, l.country, l.licenseType, l.emotionalTag, l.timestamp);
    }
}
