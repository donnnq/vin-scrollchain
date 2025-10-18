// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PurokInnovationDAO {
    address public admin;

    struct InnovationEntry {
        string idea;
        string purok;
        string steward;
        string emotionalTag;
        bool summoned;
        bool tested;
        bool scaled;
    }

    InnovationEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonInnovation(string memory idea, string memory purok, string memory steward, string memory emotionalTag) external onlyAdmin {
        entries.push(InnovationEntry(idea, purok, steward, emotionalTag, true, false, false));
    }

    function testInnovation(uint256 index) external onlyAdmin {
        entries[index].tested = true;
    }

    function scaleInnovation(uint256 index) external onlyAdmin {
        require(entries[index].tested, "Must be tested first");
        entries[index].scaled = true;
    }

    function getInnovationEntry(uint256 index) external view returns (InnovationEntry memory) {
        return entries[index];
    }
}
