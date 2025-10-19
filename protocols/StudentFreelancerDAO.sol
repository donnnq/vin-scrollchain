// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StudentFreelancerDAO {
    address public admin;

    struct FreelancerEntry {
        string youthID;
        string skillType;
        string wageSupportType;
        string emotionalTag;
        bool summoned;
        bool supported;
        bool sealed;
    }

    FreelancerEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonFreelancer(string memory youthID, string memory skillType, string memory wageSupportType, string memory emotionalTag) external onlyAdmin {
        entries.push(FreelancerEntry(youthID, skillType, wageSupportType, emotionalTag, true, false, false));
    }

    function confirmSupport(uint256 index) external onlyAdmin {
        entries[index].supported = true;
    }

    function sealFreelancer(uint256 index) external onlyAdmin {
        require(entries[index].supported, "Must be supported first");
        entries[index].sealed = true;
    }

    function getFreelancerEntry(uint256 index) external view returns (FreelancerEntry memory) {
        return entries[index];
    }
}
