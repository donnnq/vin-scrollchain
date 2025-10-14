// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GlobalRestorationTribunalDAO {
    address public admin;

    struct RestorationCase {
        string region;
        string injustice;
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

    function fileCase(string memory _region, string memory _injustice, string memory _remedy) external onlyAdmin {
        cases.push(RestorationCase(_region, _injustice, _remedy, false));
    }

    function resolveCase(uint256 index) external onlyAdmin {
        cases[index].resolved = true;
    }

    function getCase(uint256 index) external view returns (RestorationCase memory) {
        return cases[index];
    }
}
