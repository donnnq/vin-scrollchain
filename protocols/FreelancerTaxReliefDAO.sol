// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FreelancerTaxReliefDAO {
    address public admin;

    struct ReliefEntry {
        string freelancerType;
        uint256 proposedRate;
        string reliefClause;
        string emotionalTag;
        bool summoned;
        bool granted;
        bool sealed;
    }

    ReliefEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonRelief(string memory freelancerType, uint256 proposedRate, string memory reliefClause, string memory emotionalTag) external onlyAdmin {
        entries.push(ReliefEntry(freelancerType, proposedRate, reliefClause, emotionalTag, true, false, false));
    }

    function confirmGrant(uint256 index) external onlyAdmin {
        entries[index].granted = true;
    }

    function sealReliefEntry(uint256 index) external onlyAdmin {
        require(entries[index].granted, "Must be granted first");
        entries[index].sealed = true;
    }

    function getReliefEntry(uint256 index) external view returns (ReliefEntry memory) {
        return entries[index];
    }
}
