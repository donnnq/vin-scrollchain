// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ICIPublicProsecutionDAO {
    address public admin;

    struct ProsecutionEntry {
        string caseName;
        string region;
        string prosecutionStage;
        string emotionalTag;
        bool publicFiled;
    }

    ProsecutionEntry[] public prosecutions;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitProsecution(string memory _caseName, string memory _region, string memory _prosecutionStage, string memory _emotionalTag) external onlyAdmin {
        prosecutions.push(ProsecutionEntry(_caseName, _region, _prosecutionStage, _emotionalTag, false));
    }

    function filePublicly(uint256 index) external onlyAdmin {
        prosecutions[index].publicFiled = true;
    }

    function getProsecution(uint256 index) external view returns (ProsecutionEntry memory) {
        return prosecutions[index];
    }
}
