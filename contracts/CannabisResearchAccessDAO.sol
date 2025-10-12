// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title CannabisResearchAccessDAO
 * @dev Emotionally tagged smart contract to log research access approvals,
 * lab deployments, and cross-border study corridors — scrollchain-sealed knowledge.
 */

contract CannabisResearchAccessDAO {
    address public steward;

    struct Access {
        address researcher;
        string country;
        string institution;
        string emotionalTag;
        uint256 timestamp;
    }

    Access[] public accesses;

    event ResearchAccessLogged(address indexed researcher, string country, string institution, string emotionalTag, uint256 timestamp);

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log research access");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logAccess(address researcher, string memory country, string memory institution, string memory emotionalTag) external onlySteward {
        accesses.push(Access({
            researcher: researcher,
            country: country,
            institution: institution,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit ResearchAccessLogged(researcher, country, institution, emotionalTag, block.timestamp);
    }

    function getAccessByIndex(uint256 index) external view returns (address researcher, string memory country, string memory institution, string memory emotionalTag, uint256 timestamp) {
        require(index < accesses.length, "Scrollstorm index out of bounds");
        Access memory a = accesses[index];
        return (a.researcher, a.country, a.institution, a.emotionalTag, a.timestamp);
    }
}
