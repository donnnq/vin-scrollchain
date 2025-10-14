// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CrisisResponseTribunalDAO {
    address public admin;

    struct Tribunal {
        string city;
        string crisisType;
        string verdict;
        bool resolved;
    }

    Tribunal[] public tribunals;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function fileTribunal(string memory _city, string memory _crisisType, string memory _verdict) external onlyAdmin {
        tribunals.push(Tribunal(_city, _crisisType, _verdict, false));
    }

    function resolveTribunal(uint256 index) external onlyAdmin {
        tribunals[index].resolved = true;
    }

    function getTribunal(uint256 index) external view returns (Tribunal memory) {
        return tribunals[index];
    }
}
