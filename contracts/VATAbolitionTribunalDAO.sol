// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VATAbolitionTribunalDAO {
    address public admin;

    struct VATCase {
        string itemCategory;
        string impactLevel;
        string emotionalTag;
        bool abolished;
    }

    VATCase[] public cases;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function fileCase(string memory _itemCategory, string memory _impactLevel, string memory _emotionalTag) external onlyAdmin {
        cases.push(VATCase(_itemCategory, _impactLevel, _emotionalTag, false));
    }

    function abolishVAT(uint256 index) external onlyAdmin {
        cases[index].abolished = true;
    }

    function getCase(uint256 index) external view returns (VATCase memory) {
        return cases[index];
    }
}
