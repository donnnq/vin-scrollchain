// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PlanetaryScrollchainOfGraceDAO {
    address public admin;

    struct GraceScroll {
        string actOfMercy;
        string corridor;
        string emotionalTag;
        bool sealed;
    }

    GraceScroll[] public scrolls;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitScroll(string memory _actOfMercy, string memory _corridor, string memory _emotionalTag) external onlyAdmin {
        scrolls.push(GraceScroll(_actOfMercy, _corridor, _emotionalTag, false));
    }

    function sealScroll(uint256 index) external onlyAdmin {
        scrolls[index].sealed = true;
    }

    function getScroll(uint256 index) external view returns (GraceScroll memory) {
        return scrolls[index];
    }
}
