// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title GeoComplianceNoticeLedgerDAO
 * @dev Emotionally tagged smart contract to log geographic restrictions,
 * jurisdictional compliance notices, and MiCA alignment — scrollchain-sealed legality.
 */

contract GeoComplianceNoticeLedgerDAO {
    address public steward;

    struct Notice {
        address initiator;
        string region;
        string restrictionType;
        string emotionalTag;
        uint256 timestamp;
    }

    Notice[] public notices;

    event GeoComplianceNoticeLogged(address indexed initiator, string region, string restrictionType, string emotionalTag, uint256 timestamp);

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log geo compliance notices");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logNotice(address initiator, string memory region, string memory restrictionType, string memory emotionalTag) external onlySteward {
        notices.push(Notice({
            initiator: initiator,
            region: region,
            restrictionType: restrictionType,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit GeoComplianceNoticeLogged(initiator, region, restrictionType, emotionalTag, block.timestamp);
    }

    function getNoticeByIndex(uint256 index) external view returns (address initiator, string memory region, string memory restrictionType, string memory emotionalTag, uint256 timestamp) {
        require(index < notices.length, "Scrollstorm index out of bounds");
        Notice memory n = notices[index];
        return (n.initiator, n.region, n.restrictionType, n.emotionalTag, n.timestamp);
    }
}
