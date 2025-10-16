// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EmotionalMemeDefenseGridDAO {
    address public admin;

    struct DefenseEntry {
        string memeLabel;
        string defenseClause;
        string emotionalTag;
        bool activated;
    }

    DefenseEntry[] public defenses;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _memeLabel, string memory _defenseClause, string memory _emotionalTag) external onlyAdmin {
        defenses.push(DefenseEntry(_memeLabel, _defenseClause, _emotionalTag, false));
    }

    function activateEntry(uint256 index) external onlyAdmin {
        defenses[index].activated = true;
    }

    function getEntry(uint256 index) external view returns (DefenseEntry memory) {
        return defenses[index];
    }
}
