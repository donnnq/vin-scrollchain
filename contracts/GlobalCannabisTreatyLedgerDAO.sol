// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title GlobalCannabisTreatyLedgerDAO
 * @dev Emotionally tagged smart contract to track treaty participation,
 * research access, and trade corridor activation — scrollchain-sealed diplomacy.
 */

contract GlobalCannabisTreatyLedgerDAO {
    address public steward;

    struct Treaty {
        address initiator;
        string country;
        string treatyName;
        string emotionalTag;
        uint256 timestamp;
    }

    Treaty[] public treaties;

    event TreatyLogged(address indexed initiator, string country, string treatyName, string emotionalTag, uint256 timestamp);

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log treaty participation");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logTreaty(address initiator, string memory country, string memory treatyName, string memory emotionalTag) external onlySteward {
        treaties.push(Treaty({
            initiator: initiator,
            country: country,
            treatyName: treatyName,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit TreatyLogged(initiator, country, treatyName, emotionalTag, block.timestamp);
    }

    function getTreatyByIndex(uint256 index) external view returns (address initiator, string memory country, string memory treatyName, string memory emotionalTag, uint256 timestamp) {
        require(index < treaties.length, "Scrollstorm index out of bounds");
        Treaty memory t = treaties[index];
        return (t.initiator, t.country, t.treatyName, t.emotionalTag, t.timestamp);
    }
}
