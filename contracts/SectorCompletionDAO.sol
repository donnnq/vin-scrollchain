// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SectorCompletionDAO {
    address public admin;

    struct SectorEntry {
        string sectorName;
        string completionClause;
        string emotionalTag;
        bool fulfilled;
    }

    SectorEntry[] public sectors;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitSector(string memory _sectorName, string memory _completionClause, string memory _emotionalTag) external onlyAdmin {
        sectors.push(SectorEntry(_sectorName, _completionClause, _emotionalTag, false));
    }

    function markFulfilled(uint256 index) external onlyAdmin {
        sectors[index].fulfilled = true;
    }

    function getSector(uint256 index) external view returns (SectorEntry memory) {
        return sectors[index];
    }
}
