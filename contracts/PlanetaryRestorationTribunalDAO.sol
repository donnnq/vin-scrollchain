// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PlanetaryRestorationTribunalDAO {
    address public admin;

    struct RestorationCase {
        string region;
        string issue;
        string verdict;
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

    function fileCase(string memory _region, string memory _issue, string memory _verdict) external onlyAdmin {
        cases.push(RestorationCase(_region, _issue, _verdict, false));
    }

    function resolveCase(uint256 index) external onlyAdmin {
        cases[index].resolved = true;
    }

    function getCase(uint256 index) external view returns (RestorationCase memory) {
        return cases[index];
    }
}
