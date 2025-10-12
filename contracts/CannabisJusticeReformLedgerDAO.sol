// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title CannabisJusticeReformLedgerDAO
 * @dev Emotionally tagged smart contract to log criminal justice reforms,
 * expungements, and dignity restorations — scrollchain-sealed consequence.
 */

contract CannabisJusticeReformLedgerDAO {
    address public steward;

    struct Reform {
        address initiator;
        string country;
        string reformType;
        string emotionalTag;
        uint256 timestamp;
    }

    Reform[] public reforms;

    event JusticeReformLogged(address indexed initiator, string country, string reformType, string emotionalTag, uint256 timestamp);

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log justice reforms");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logReform(address initiator, string memory country, string memory reformType, string memory emotionalTag) external onlySteward {
        reforms.push(Reform({
            initiator: initiator,
            country: country,
            reformType: reformType,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit JusticeReformLogged(initiator, country, reformType, emotionalTag, block.timestamp);
    }

    function getReformByIndex(uint256 index) external view returns (address initiator, string memory country, string memory reformType, string memory emotionalTag, uint256 timestamp) {
        require(index < reforms.length, "Scrollstorm index out of bounds");
        Reform memory r = reforms[index];
        return (r.initiator, r.country, r.reformType, r.emotionalTag, r.timestamp);
    }
}
