// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CorruptionReckoningDAO {
    address public admin;

    struct ReckoningEntry {
        string agencyName;
        string corruptionTheme;
        string emotionalTag;
        bool summoned;
        bool resolved;
    }

    ReckoningEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonReckoning(string memory agencyName, string memory corruptionTheme, string memory emotionalTag) external onlyAdmin {
        entries.push(ReckoningEntry(agencyName, corruptionTheme, emotionalTag, true, false));
    }

    function resolveReckoning(uint256 index) external onlyAdmin {
        entries[index].resolved = true;
    }

    function getReckoning(uint256 index) external view returns (ReckoningEntry memory) {
        return entries[index];
    }
}
