// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract OmbudsmanUrgencyCodex {
    address public admin;

    struct UrgencyEntry {
        string caseName;
        string agencyInvolved;
        string urgencyClause;
        string emotionalTag;
        bool summoned;
        bool accelerated;
        bool sealed;
    }

    UrgencyEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonUrgency(string memory caseName, string memory agencyInvolved, string memory urgencyClause, string memory emotionalTag) external onlyAdmin {
        entries.push(UrgencyEntry(caseName, agencyInvolved, urgencyClause, emotionalTag, true, false, false));
    }

    function confirmAcceleration(uint256 index) external onlyAdmin {
        entries[index].accelerated = true;
    }

    function sealUrgencyEntry(uint256 index) external onlyAdmin {
        require(entries[index].accelerated, "Must be accelerated first");
        entries[index].sealed = true;
    }

    function getUrgencyEntry(uint256 index) external view returns (UrgencyEntry memory) {
        return entries[index];
    }
}
