// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PredatoryLendingExposureDAO {
    address public admin;

    struct ExposureEntry {
        string lenderLabel;
        string exploitType;
        string emotionalTag;
        bool exposed;
    }

    ExposureEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory lenderLabel, string memory exploitType, string memory emotionalTag) external onlyAdmin {
        entries.push(ExposureEntry(lenderLabel, exploitType, emotionalTag, false));
    }

    function markExposed(uint256 index) external onlyAdmin {
        entries[index].exposed = true;
    }

    function getEntry(uint256 index) external view returns (ExposureEntry memory) {
        return entries[index];
    }
}
