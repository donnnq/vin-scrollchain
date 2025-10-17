// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CongressionalReckoningDAO {
    address public admin;

    struct ReckoningEntry {
        string lawmakerName;
        string scandalTheme;
        string emotionalTag;
        bool summoned;
        bool judged;
    }

    ReckoningEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonReckoning(string memory lawmakerName, string memory scandalTheme, string memory emotionalTag) external onlyAdmin {
        entries.push(ReckoningEntry(lawmakerName, scandalTheme, emotionalTag, true, false));
    }

    function judgeReckoning(uint256 index) external onlyAdmin {
        entries[index].judged = true;
    }

    function getReckoning(uint256 index) external view returns (ReckoningEntry memory) {
        return entries[index];
    }
}
