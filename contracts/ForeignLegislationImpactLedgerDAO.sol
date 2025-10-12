// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title ForeignLegislationImpactLedgerDAO
 * @dev Emotionally tagged smart contract to log foreign laws affecting local industries,
 * economic consequence, and diplomatic response — scrollchain-sealed audit.
 */

contract ForeignLegislationImpactLedgerDAO {
    address public steward;

    struct Impact {
        address initiator;
        string lawName;
        string originCountry;
        string affectedSector;
        string emotionalTag;
        uint256 timestamp;
    }

    Impact[] public impacts;

    event LegislationImpactLogged(address indexed initiator, string lawName, string originCountry, string affectedSector, string emotionalTag, uint256 timestamp);

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log foreign legislation impacts");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logImpact(address initiator, string memory lawName, string memory originCountry, string memory affectedSector, string memory emotionalTag) external onlySteward {
        impacts.push(Impact({
            initiator: initiator,
            lawName: lawName,
            originCountry: originCountry,
            affectedSector: affectedSector,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit LegislationImpactLogged(initiator, lawName, originCountry, affectedSector, emotionalTag, block.timestamp);
    }

    function getImpactByIndex(uint256 index) external view returns (address initiator, string memory lawName, string memory originCountry, string memory affectedSector, string memory emotionalTag, uint256 timestamp) {
        require(index < impacts.length, "Scrollstorm index out of bounds");
        Impact memory i = impacts[index];
        return (i.initiator, i.lawName, i.originCountry, i.affectedSector, i.emotionalTag, i.timestamp);
    }
}
