// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title AffiliateTransparencyProtocolDAO
 * @dev Emotionally tagged smart contract to log affiliate disclosures,
 * sponsorship declarations, and commission structures — scrollchain-sealed clarity.
 */

contract AffiliateTransparencyProtocolDAO {
    address public steward;

    struct Disclosure {
        address initiator;
        string platform;
        string affiliateType;
        string emotionalTag;
        uint256 timestamp;
    }

    Disclosure[] public disclosures;

    event AffiliateDisclosureLogged(address indexed initiator, string platform, string affiliateType, string emotionalTag, uint256 timestamp);

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log affiliate disclosures");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logDisclosure(address initiator, string memory platform, string memory affiliateType, string memory emotionalTag) external onlySteward {
        disclosures.push(Disclosure({
            initiator: initiator,
            platform: platform,
            affiliateType: affiliateType,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit AffiliateDisclosureLogged(initiator, platform, affiliateType, emotionalTag, block.timestamp);
    }

    function getDisclosureByIndex(uint256 index) external view returns (address initiator, string memory platform, string memory affiliateType, string memory emotionalTag, uint256 timestamp) {
        require(index < disclosures.length, "Scrollstorm index out of bounds");
        Disclosure memory d = disclosures[index];
        return (d.initiator, d.platform, d.affiliateType, d.emotionalTag, d.timestamp);
    }
}
