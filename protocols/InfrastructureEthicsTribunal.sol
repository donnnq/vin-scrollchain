// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract InfrastructureEthicsTribunal {
    address public admin;

    struct OfficialEntry {
        string name;
        string position;
        string emotionalTag;
        bool summoned;
        bool flagged;
        bool resigned;
    }

    OfficialEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonOfficial(string memory name, string memory position, string memory emotionalTag) external onlyAdmin {
        entries.push(OfficialEntry(name, position, emotionalTag, true, false, false));
    }

    function flagForConflict(uint256 index) external onlyAdmin {
        entries[index].flagged = true;
    }

    function markResigned(uint256 index) external onlyAdmin {
        entries[index].resigned = true;
    }

    function getOfficialEntry(uint256 index) external view returns (OfficialEntry memory) {
        return entries[index];
    }
}
