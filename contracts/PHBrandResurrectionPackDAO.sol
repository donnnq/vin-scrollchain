// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PHBrandResurrectionPackDAO {
    address public admin;

    struct BrandEntry {
        string brandLabel;
        string resurrectionClause;
        string emotionalTag;
        bool revived;
    }

    BrandEntry[] public brands;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _brandLabel, string memory _resurrectionClause, string memory _emotionalTag) external onlyAdmin {
        brands.push(BrandEntry(_brandLabel, _resurrectionClause, _emotionalTag, false));
    }

    function reviveEntry(uint256 index) external onlyAdmin {
        brands[index].revived = true;
    }

    function getEntry(uint256 index) external view returns (BrandEntry memory) {
        return brands[index];
    }
}
