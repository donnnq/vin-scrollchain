// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ElectionReckoningCodex {
    address public admin;

    struct ReckoningEntry {
        string candidateName;
        string issueTheme;
        string emotionalTag;
        bool summoned;
        bool verified;
    }

    ReckoningEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonReckoning(string memory candidateName, string memory issueTheme, string memory emotionalTag) external onlyAdmin {
        entries.push(ReckoningEntry(candidateName, issueTheme, emotionalTag, true, false));
    }

    function verifyReckoning(uint256 index) external onlyAdmin {
        entries[index].verified = true;
    }

    function getReckoning(uint256 index) external view returns (ReckoningEntry memory) {
        return entries[index];
    }
}
