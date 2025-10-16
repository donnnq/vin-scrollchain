// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LegacyRestorationDAO {
    address public admin;

    struct RestorationEntry {
        string legacyLabel;
        string restorationClause;
        string emotionalTag;
        bool restored;
    }

    RestorationEntry[] public legacies;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _legacyLabel, string memory _restorationClause, string memory _emotionalTag) external onlyAdmin {
        legacies.push(RestorationEntry(_legacyLabel, _restorationClause, _emotionalTag, false));
    }

    function restoreEntry(uint256 index) external onlyAdmin {
        legacies[index].restored = true;
    }

    function getEntry(uint256 index) external view returns (RestorationEntry memory) {
        return legacies[index];
    }
}
