// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract JusticeRestorationDAO {
    address public admin;

    struct RestorationCase {
        string caseName;
        string injusticeType;
        string remedy;
        bool resolved;
    }

    RestorationCase[] public cases;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function fileCase(string memory _caseName, string memory _injusticeType, string memory _remedy) external onlyAdmin {
        cases.push(RestorationCase(_caseName, _injusticeType, _remedy, false));
    }

    function resolveCase(uint256 index) external onlyAdmin {
        cases[index].resolved = true;
    }

    function getCase(uint256 index) external view returns (RestorationCase memory) {
        return cases[index];
    }
}
