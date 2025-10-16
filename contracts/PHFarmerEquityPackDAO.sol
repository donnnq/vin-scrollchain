// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PHFarmerEquityPackDAO {
    address public admin;

    struct FarmerEntry {
        string regionLabel;
        string equityClause;
        string emotionalTag;
        bool supported;
    }

    FarmerEntry[] public farmers;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _regionLabel, string memory _equityClause, string memory _emotionalTag) external onlyAdmin {
        farmers.push(FarmerEntry(_regionLabel, _equityClause, _emotionalTag, false));
    }

    function markSupported(uint256 index) external onlyAdmin {
        farmers[index].supported = true;
    }

    function getEntry(uint256 index) external view returns (FarmerEntry memory) {
        return farmers[index];
    }
}
