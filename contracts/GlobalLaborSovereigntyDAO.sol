// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GlobalLaborSovereigntyDAO {
    address public admin;

    struct TreatyEntry {
        string hostCountry;
        string laborRight;
        string emotionalTag;
        bool ratified;
        bool enforced;
    }

    TreatyEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function ratifyTreaty(string memory hostCountry, string memory laborRight, string memory emotionalTag) external onlyAdmin {
        entries.push(TreatyEntry(hostCountry, laborRight, emotionalTag, true, false));
    }

    function enforceTreaty(uint256 index) external onlyAdmin {
        entries[index].enforced = true;
    }

    function getTreatyEntry(uint256 index) external view returns (TreatyEntry memory) {
        return entries[index];
    }
}
