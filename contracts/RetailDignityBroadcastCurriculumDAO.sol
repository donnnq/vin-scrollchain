// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RetailDignityBroadcastCurriculumDAO {
    address public admin;

    struct CurriculumEntry {
        string segmentLabel;
        string dignityClause;
        string emotionalTag;
        bool aired;
    }

    CurriculumEntry[] public curriculum;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _segmentLabel, string memory _dignityClause, string memory _emotionalTag) external onlyAdmin {
        curriculum.push(CurriculumEntry(_segmentLabel, _dignityClause, _emotionalTag, false));
    }

    function airEntry(uint256 index) external onlyAdmin {
        curriculum[index].aired = true;
    }

    function getEntry(uint256 index) external view returns (CurriculumEntry memory) {
        return curriculum[index];
    }
}
